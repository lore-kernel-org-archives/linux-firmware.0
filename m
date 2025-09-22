Return-Path: <SRS0=MhYL=4B=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11953CAC592
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Sep 2025 09:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA563C116B1; Mon, 22 Sep 2025 09:56:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13179C4CEF0
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 09:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13179C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M8vfMf031908
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 09:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGfzdx2P4IpRh5j0HrwwsnuMGOIzDidgb3qJT3a+MDo=; b=SZnwle+cSN/SR3M3
	x3x+vsM9dwSTRahveycdfrKiD+n44sTVCNF7rZP+9V6uLXgefcdfRuCD8Bmxw7nb
	Un/wfAB58pz68Fsw8jgXOni5u+QSsKZXvNgpmlGJTwAf9oRds88yySW/DrMEC4hB
	nYP6LSC1TE5UJ2Lm2X8CJTV3ovF3KfLk3P/nOFChmc0BlujkPwwJ3d32DBNhm2IG
	4uI+HfuFSKUB07mdjozvts9DPS07s8qpJ2at1x29VVJipQpEGcJvo6yfvFUN4FdV
	p8PhrHdfxlZNKKntd2l/84jThaeAAH3w+nuVlJSKHZ7EjTcDKaTlzwbJEKRqmhmA
	ZQSvcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemjyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 09:56:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so44962045ad.2
        for <linux-firmware@kernel.org>; Mon, 22 Sep 2025 02:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535017; x=1759139817;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGfzdx2P4IpRh5j0HrwwsnuMGOIzDidgb3qJT3a+MDo=;
        b=ldbSz1fAYJhmKeo5LojNnNqxlQOBV3ns9QXv6Frj0I/urCwmvJWTo7Vw9j+CIGzj3F
         dWhgvg/hBhxJWoa64MsvDAoXZ6MvTLFappqMlGzuiRHq3bnkMo2EFo0QmuwPKUGXBCEy
         4Vuuh9c1hr+PY88Hcu27pI5o+Z+ayFv1haaojZrps3vL1/K3eFxNIwfpfm8iJXZg3C8c
         jCaKKg+cfs74VKb2Y3q0kmQ86VcolJl5gd3DcRdvgei8nKxHS/XmFj/w9WJm3BkMw/b9
         alb9PXW6SV0Y7Gmul94x02tBBkvWze51o1Jg/Xr0eVe0guY0rfzrgGQDEknxZLbBTyto
         yvLA==
X-Gm-Message-State: AOJu0YxIHh/6QSex+IS2F1OXcMbYOiLH638Gnz0/3bmxGQjh/2pFHNuN
	h9Xd9p9J8J5KDZuWx3JatHSrqSKm56q4Pi83xJmwsGFqSWRo64cE5t0BYfbv0eLVRaHvqM5bfwA
	FFeDuJAyzEAPnmqKQeUbnS7rlfOf8oPhPWkplzjzxRWcv4IJS/lMi4hBbw7u6o1o=
X-Gm-Gg: ASbGnctGckTFSVmlvLAtaSfSnRIOUej/5F4ltPNmtbv1brEQgQ+CDvWVHXi3GETz5Oq
	LSU0rkklpxV6dd4Q/7qY9UJ9+aDnK/nTT3gzn4ueuZtczXG1YYSsz1Zf1CS/bq2xkhVSLQIc2AH
	umKag7mwAkonakSRN4jltHv3EaV05g4wt3F748Js/2G12/sdSua7Too/cCLXwJrSdb7Cl/cF2pK
	InqT1Q9cZV8SYmrnQRxYqkQjrGz2zw6cMpxU/VA34s6vsJxIcJxf1uF8uxKiQQzYeWKEUVUPIWB
	0jGDD0Ym1JmmXnX0OY1s6/ZEqSGD1H1Cgdbow+oSrMryHWFu3PmISfb9JlICjRZADgHb
X-Received: by 2002:a17:903:2347:b0:270:b1f7:2e5e with SMTP id d9443c01a7336-270b1f730b2mr108266495ad.22.1758535017022;
        Mon, 22 Sep 2025 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsq0vJGY+F4JNuLCpjF5X+Maboj3n4wg5lPFUfUSzpwKXVoixGNftZrdCQhhLaxrXZw/Az2Q==
X-Received: by 2002:a17:903:2347:b0:270:b1f7:2e5e with SMTP id d9443c01a7336-270b1f730b2mr108266225ad.22.1758535016595;
        Mon, 22 Sep 2025 02:56:56 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bea0sm128152415ad.40.2025.09.22.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 02:56:56 -0700 (PDT)
Message-ID: <23ef6993-11a2-451f-9bed-9b0767a028cf@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:26:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
References: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
 <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6>
 <4264588a-93b0-47d6-a8be-9ffca550142d@oss.qualcomm.com>
 <CAO9ioeVC1H5c4RHoUroytAUbO9hQVvyQ-ep_ofUP-iR7EgDg2A@mail.gmail.com>
 <ce6189cd-1355-47f0-bd03-79746577196b@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 xsDNBGi/G3sBDADFuRVyKREhDod8d+uJxADC+IXOVOXP1Qigxt4a5Cx2rOhULbviJfiJWIsQ
 Rzlc4N1GfhTLpeNoqzd7/LAbnpc/jw0cq+f3EWPaIla0lIKthTCtMCkC5af3NyeqM64xHMMI
 W0SsUO1Zyeio970o6YcFCi90a6gNy4+cTLM3fx9wuaO0TBdkh/bsUmGx1RTZqby6Au0wBoyX
 FzDvHUYApShff+C7JNhmCkbMx33Wwt79ELPlCACFO0IH7ZS1gj5VfBOrNl3Pp0VVfQdcngex
 AvFdSiNccPgxdSWxRCPc1DvLKoq0o0ZLXerqnC31xtBpdu2J4hp+snIclks8+RBwBEoRIfql
 buJIFTzBY583dm3Z5kIwfBIRUa5o23kPv3QbbcsvCOjPE2qsyZy54ddIgTlclTwnJ0yMXRaA
 a595R72PdZ7Nz9u45mFJI+VvUQpjym11dqJKxgvoYSQ4NXVqX2xQ5Ap+F9l4p38dhCbbENFe
 h3VmQWcJ3razk/34iYHu0vsAEQEAAc0sVmVua2F0YSBLb3RhIDx2ZW5rYXRhLmtvdGFAb3Nz
 LnF1YWxjb21tLmNvbT7CwQ0EEwEIADcWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEFLbGZzv/BR38P0MAL7byTdYQ/8/X3yWSduV
 leTR24juRoG8SeKc8HNug7TBdMxLH6zkbqFSs1PsNMRdEUHey+Pp4uB9RCHsDb9IiHecfn73
 uA+CjHyRrnbVM+u3EeCHvt79QacKsZ5SMBfW2FwVRcsg1fozW+e3SM1RjWbIYtU/QVbx8gO/
 mnFTgnrZ5mHgk/DK2zYRbIUG13ZJN5NDbFhDEKbNNeW2OFuJgAnaWw9Ka2XaRC5dFluen7PN
 0E32OEiiUVSiFBT34Of2qNDGWj+GAkN5fvRa9jU4pNSYgQPt6+shaaN18OoZvZStJbe6wInh
 KByf/2tjqGLZ1Gn6T2s1QR1R6VkoyfhjVG4iYjSpdsMEJN25Wa9d7LeGWdRO5V6NpMIw5Y0D
 TMQ9dVW2c/jU+AuLJ2YcUi3D7kWHVu4s565SLaovEPxkGj2u7WQBEZCDGr7QNeITV6vjI+w2
 38SINd7HsH9LMCDnDFCelbbnyTw9yM66Q2VyKud4nGzQ3HhoD7eMkbJKYWG5As7AzQRovxt8
 AQwAvS7iU5Ee+lb9JJ+MFe0JFm8RQllN6wA5yZWoHzG4EfZ0eusLmdEZioHbSST9UBme9HoV
 wTdvKhrrp+EWIX4zAVqH3xXShSnJ7tlsTWf8D6GV4ctHEu2fRRypXJ6GpJDLjtMUYOWM/ho2
 BntduLHo5J3yg3PvgMj9nTDOcwyNKBzhycXxNQk8ExT2AU5YqR8Q2NWF4BOW+Lac/I8QM32/
 IrGqPMwTkcqv3CJMk+RCRxRSsP7ji2g19k9aqFV32jjvvKr8J/BAxLO7di0+ETCq8h3M2/td
 Xc23DCQa5W5grCNHnG3J9lj6PBvG4/WvQQGnP9lLCrEjkInq+YQY5PU0OwsTNBMeaO5Grnmr
 cgQ9GIEGxd51qyZHc2rFDcJai5Q2JpwkihfDuO1MVnaOkrD5odDyAjKr8oJqbu3hFvqUUtTb
 OtM3tODZ+cAJPJ8WkG2DkT6YFKw/6SSEdsg5XOmKA8i7OA6fVwHg7jiHlzXB2kzxqS20JShl
 Y9WJAc8YIcG9ABEBAAHCwPwEGAEIACYWIQQpVT+myzILz3YmKTNS2xmc7/wUdwUCaL8bfAUJ
 BaOagAIbDAAKCRBS2xmc7/wUd3ayDACEHZxA4o7NVyv9z7pdxzSFZ34Tv//HBfyzZPx6b5vV
 OI3PEFT9jSBqwwWVwwLdRoE6vw3dNAuHUa5IoiXkIo7CRtvddLPryPyHwq4+I8uRfn8jNNgD
 4+5weUZvMtGZlxjtV4jXEdRwZuFrlY/p3nyvGFBjkes7pEBExjDuW4ligyYKF7pM+Ndrkw5n
 q7lTD5c8evUv4q2Fs9KCxyaKwAOb1z2s8tO3EeOmGWmhLWgtS4o/rv4hDNfyCji6BjNGFpt1
 5yiRSqo4FJuz+Lr6GEO1sod/MHZF97iUOHDoaOIoeKwX246DwtXL0LQuYqNrq7ryPunmTpOE
 qaXWztaQtxsBJdBKUeEO6/ukSPYTZiTyXZi4M309uDiX5EDXIiimX7Vfzf6qWYln3jtpca7+
 wjt8XHC+OAMMkCkL62+osvHOhazJAS2xCR71LEn81bXxEIs72zc1R7U6Gk2P9K8t3NbaLNBU
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <ce6189cd-1355-47f0-bd03-79746577196b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8ETOO0rjsE20I1sC3JxueuWtMg4nWYsg
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d11d6a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=E1S4rd__wVuxVeD6ozYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX4NxMnM5Vg6XA
 2pSqi5Ys2uBuji0M4FkaxrvikEVIIXtX/eWNjCnTEN7fFGpiWIGOfojOILwTPfqfKUvKzxMYlua
 dXg68IXM4lauUpmsBP0Xz9KzCv3lPNeBRf6utmUymjsBLGoFs86Tsg90WYyEkgm+iKCCVGmUR76
 sM26FGhbZ6bt/qBRBwfvlpHWuTjJihZRxxSpZ5ds7e8DZnKseasY0POtI5ZpfkVgtLpj0Brkl9c
 c9m6gz/9BYOLZGOsCvaofpr/hoKu+UQe8bF7zYEOca71GK1WoqSKZXpI3yCkAeVm69u+blVIl3Q
 EVctRuuC3RFZQMPFDpc7wsRZRT4Qd16SRKbAxTO2fe+pkY0EIT2uhpLYlGpPq1dQGpg1Kf4xJtD
 7qOThYG6
X-Proofpoint-ORIG-GUID: 8ETOO0rjsE20I1sC3JxueuWtMg4nWYsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004



On 9/18/2025 7:48 PM, Venkata Kota wrote:
> 
> 
> On 9/18/2025 7:37 PM, Dmitry Baryshkov wrote:
>> On Thu, 18 Sept 2025 at 16:50, Venkata Kota
>> <venkata.kota@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 9/18/2025 5:48 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Sep 18, 2025 at 12:09:32PM +0530, Venkata Kota wrote:
>>>>>     Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>> dsp-fw-qcs8300_1
>>>>>
>>>>> for you to fetch changes up to 
>>>>> 36da01bec9809f7bd96594db4885a86c286e90a9:
>>>>>
>>>>>     qcom: Update DSP firmware for QCS8300 platform (2025-09-18 
>>>>> 11:49:22 +0530)
>>>>
>>>> NAK, you are explaining what GPDSP is, but you are not explaining what
>>>> and why is being done. Why do you add Audio PD to the GPDSP?
>>>
>>> There is no specific change made to GPDSP in this release. This is just
>>> an update on the previous label Version: DSP.AT.1.0.1-00096-LEMANS-1.
>>
>> You have added Protection Domain definitions for GPDSP. I have been
>> asking you to explain that part in the commit message.
> ACK, I will do the needful.>
The current Audio Reach Framework is yet to support audio use cases in 
the gpdsp for upstream. The support for the same is work in progress for 
upstream. I am removing gpdspr.jsn and gpdspua.jsn and push a new 
firmware with out these files for now. These files would be added when 
the support is available from Audio Reach Framewok.>>>>> 
----------------------------------------------------------------
>>>>> Venkata Kota (1):
>>>>>         qcom: Update DSP firmware for QCS8300 platform
>>>>>
>>>>>    WHENCE                   |   9 ++++++---
>>>>>    qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>>>>    qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>>>>>    qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>>>>>    qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>>>>    qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>>>>    6 files changed, 57 insertions(+), 3 deletions(-)
>>>>>    create mode 100644 qcom/qcs8300/gpdspr.jsn
>>>>>    create mode 100644 qcom/qcs8300/gpdspua.jsn
>>
> 
> 
t
