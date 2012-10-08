/**
 * Version:      0.0001(dmd2.060)
 * Date:         2012-Oct-08 23:30:31
 * Authors:      KUMA
 * License:      CC0
*/

// Apple's Original License
/*
 * Copyright (c) 2009 Apple Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 * 
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 * 
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 */
/*	CFByteOrder.h
	Copyright (c) 1995-2009, Apple Inc. All rights reserved.
*/
module CoreFoundation.CFByteOrder;

import CoreFoundation.CFBase;

extern(C):

enum CFByteOrder {
    Unknown,
    LittleEndian,
    BigEndian
}

CFByteOrder CFByteOrderGetCurrent()
{
	version(CF_USE_OSBYTEORDER_H)
	{
		int32_t byteOrder = OSHostByteOrder();
		switch (byteOrder) {
		case OSLittleEndian: return CFByteOrderLittleEndian;
		case OSBigEndian: return CFByteOrderBigEndian;
		default: break;
		}
		return CFByteOrderUnknown;
	}
	else
	{
		version( LittleEndian ) return CFByteOrder.LittleEndian;
		else version( BigEndian ) return CFByteOrder.BigEndian;
		else return CFByteOrder.Unknown;
	}
}

ushort CFSwapInt16(ushort arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapInt16(arg);
	else
	{
    ushort result;
    result = cast(ushort)(((arg << 8) & 0xFF00) | ((arg >> 8) & 0xFF));
    return result;
	}
}

uint CFSwapInt32(uint arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapInt32(arg);
	else
	{
		uint result;
		result = ((arg & 0xFF) << 24) | ((arg & 0xFF00) << 8) | ((arg >> 8) & 0xFF00) | ((arg >> 24) & 0xFF);
		return result;
	}
}

ulong CFSwapInt64(ulong arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapInt64(arg);
	else
	{
		union CFSwap
		{
			ulong sv;
			uint[2] ul;
		};
		CFSwap tmp, result;
		tmp.sv = arg;
		result.ul[0] = CFSwapInt32(tmp.ul[1]);
		result.ul[1] = CFSwapInt32(tmp.ul[0]);
		return result.sv;
	}
}

ushort CFSwapInt16BigToHost(ushort arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapBigToHostInt16(arg);
	else version( BigEndian ) return arg;
	else return CFSwapInt16(arg);
}

uint CFSwapInt32BigToHost(uint arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapBigToHostInt32(arg);
	else version( BigEndian ) return arg;
	else return CFSwapInt32(arg);
}

ulong CFSwapInt64BigToHost(ulong arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapBigToHostInt64(arg);
	else version( BigEndian ) return arg;
  else return CFSwapInt64(arg);
}

ushort CFSwapInt16HostToBig(ushort arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToBigInt16(arg);
	else version( BigEndian ) return arg;
  else return CFSwapInt16(arg);
}

uint CFSwapInt32HostToBig(uint arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToBigInt32(arg);
	else version( BigEndian ) return arg;
	else return CFSwapInt32(arg);
}

ulong CFSwapInt64HostToBig(ulong arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToBigInt64(arg);
	else version( BigEndian ) return arg;
	else return CFSwapInt64(arg);
}

ushort CFSwapInt16LittleToHost(ushort arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapLittleToHostInt16(arg);
	else version( LittleEndian ) return arg;
  else return CFSwapInt16(arg);
}

uint CFSwapInt32LittleToHost(uint arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapLittleToHostInt32(arg);
	else version( LittleEndian ) return arg;
  else return CFSwapInt32(arg);
}

ulong CFSwapInt64LittleToHost(ulong arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapLittleToHostInt64(arg);
	else version( LittleEndian ) return arg;
	else return CFSwapInt64(arg);
}

ushort CFSwapInt16HostToLittle(ushort arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToLittleInt16(arg);
	else version( LittleEndian ) return arg;
	else return CFSwapInt16(arg);
}

uint CFSwapInt32HostToLittle(uint arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToLittleInt32(arg);
	else version( LittleEndian ) return arg;
	else return CFSwapInt32(arg);
}

ulong CFSwapInt64HostToLittle(ulong arg)
{
	version(CF_USE_OSBYTEORDER_H) return OSSwapHostToLittleInt64(arg);
	else version( LittleEndian ) return arg;
	else return CFSwapInt64(arg);
}

struct CFSwappedFloat32{uint v;}
struct CFSwappedFloat64{ulong v;}

CFSwappedFloat32 CFConvertFloat32HostToSwapped(Float32 arg)
{
	union CFSwap
	{
		Float32 v;
		CFSwappedFloat32 sv;
	}
	CFSwap result;
  result.v = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt32(result.sv.v);
	return result.sv;
}

Float32 CFConvertFloat32SwappedToHost(CFSwappedFloat32 arg)
{
	union CFSwap
	{
		Float32 v;
		CFSwappedFloat32 sv;
	}
	CFSwap result;
	result.sv = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt32(result.sv.v);
	return result.v;
}

CFSwappedFloat64 CFConvertFloat64HostToSwapped(Float64 arg)
{
	union CFSwap
	{
		Float64 v;
		CFSwappedFloat64 sv;
	}
	CFSwap result;
	result.v = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt64(result.sv.v);
	return result.sv;
}

Float64 CFConvertFloat64SwappedToHost(CFSwappedFloat64 arg)
{
	union CFSwap
	{
		Float64 v;
		CFSwappedFloat64 sv;
	}
	CFSwap result;
	result.sv = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt64(result.sv.v);
	return result.v;
}

CFSwappedFloat32 CFConvertFloatHostToSwapped(float arg)
{
	union CFSwap
	{
		float v;
		CFSwappedFloat32 sv;
	}
	CFSwap result;
	result.v = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt32(result.sv.v);
	return result.sv;
}

float CFConvertFloatSwappedToHost(CFSwappedFloat32 arg)
{
	union CFSwap
	{
		float v;
		CFSwappedFloat32 sv;
	}
	CFSwap result;
	result.sv = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt32(result.sv.v);
	return result.v;
}

CFSwappedFloat64 CFConvertDoubleHostToSwapped(double arg)
{
	union CFSwap
	{
		double v;
		CFSwappedFloat64 sv;
	}
	CFSwap result;
	result.v = arg;
	version( LittleEndian ) result.sv.v = CFSwapInt64(result.sv.v);
	return result.sv;
}

double CFConvertDoubleSwappedToHost(CFSwappedFloat64 arg)
{
	union CFSwap
	{
		double v;
		CFSwappedFloat64 sv;
	}
	CFSwap result;
	result.sv = arg;
	version(LittleEndian) result.sv.v = CFSwapInt64(result.sv.v);
	return result.v;
}
