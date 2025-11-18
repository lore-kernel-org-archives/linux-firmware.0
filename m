Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72220CEE32A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 15:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27862C116D0; Tue, 18 Nov 2025 15:50:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAC2BC2BCB2
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAC2BC2BCB2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIEHP7v623776
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8RF8QBDQPOKUaL/85sO9rVFw0SbMYGqGOqbAimU02I=; b=W4VgSdCrR4rGv74y
	vW1xnLFcPZkJ4UxzcObBsYAeJYHMYHI+ltu0Hm308ulXNJIydhCHSGy6ZUtFThyI
	lT66c0kHqPUrAg29xV4QjAqna4FIFRtdXk/V+xaoLuM8yXvArqCW6FpoLI/OzYEN
	858AuR03slmzZZkY0PD1r8c0l9wUpSHEtlw8GtmroWBAlPZ4prKOK48q9t6/mA80
	L8Es3JJthnb9o5ayTzJ6jyqTKTrUJdYidQAoOym20C/OFuJBdddNpzZa6USSjpyd
	TjFS7l2Z5BZCwNQ/Mdo0NzaVcaqtXJspvEFfp24YvqGoLjCuZi4tai4Nk+PRZ0Vf
	0FYTow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfay5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 15:50:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be94e1a073so5063016b3a.2
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763481027; x=1764085827; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8RF8QBDQPOKUaL/85sO9rVFw0SbMYGqGOqbAimU02I=;
        b=WnlUH5ScHKwE2Uxcb6iZFc8FzAu2rvNR15WHnuXlPBujWTax2SOW8iq6M5UHSy+T6D
         lKRrR/berwnGkETMdb+KlEkpWJ2Vu3fy6WvubhJrvPa9fqLavIs1A4vdKHeKC5ZgMOgv
         BjPbyvtPTw2bJcOQ42HpESwLGZ8Xmp0i5C1hOPaW/UTev5ou5546EjAfbxV2WVGN4vn+
         xYxv6RRvYzkuNFmGGw20uGekpXW9LX45a9lIpyRbIl4BJ/ODxbYS7C7H6tGEj90s4+IN
         EeSEUiL0+Bv1wr9z5OUHSkX/yLfAJ0V2KTpz1I+idpzXRRXgbFXvMB4WiMw9j5YFxG+e
         VEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481027; x=1764085827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8RF8QBDQPOKUaL/85sO9rVFw0SbMYGqGOqbAimU02I=;
        b=nRF3Wj7Zq57otub3MSyLnXRYp5PvRliVL+aq8AxPifP6bNq9d/bLHuHsmFPs+256Y2
         q18H0d8wMGQUEJamJfuqi3Larx/XJ+K7kWsY1z1GTe/rY2lisNzNBMSD0HvVPX7w+dRL
         5lu8nYFO1gzES+jy1CkJ7rl/AALzn0qqG/PnEnl2cqMig/dntDV1Fq5vN2yv5vCzuffv
         YhxhVJMZHliWxwwE9UHIJTG2pqCW4HImtrGMhG2pxM9ldC5JfM7x9icF80xiIyiVu3mC
         0LhEzKYyOwY2P+zJdJr3nBdqDx9o7nvdV3mChQEyeCUbn7Onrudlq3j8D4Bvy8MLzORM
         rCEQ==
X-Gm-Message-State: AOJu0YzjOoL3WX0GOmkdhSDP9jjWcBqNknuLvOXd4qDA/fWJNESzdeJk
	JtmDY9m0J7braTojsWxVi8z8pUGeTpzF/CdDKry9IE7vq4FGDZzs71CaZFYLvdixLyHZu8YCShy
	OTroTNxL+xTvavY6njVheGzxkHAJsz0d9tXeHFT2ZImyCqvKy5hyXdjFDD8wPlFo=
X-Gm-Gg: ASbGncvna+s/eHYX100a4wWT3MJPPnF3/uadKmLgEk/xwHkOkGR3L0Ki8GcSxN2/70o
	/zIDA4Q5xaTnEEgbG6O03CR2hmUNr73ynwTKGFyisG0szBOwC8j7f1gLhtDqDcIPE6FS/saEB/B
	06WvIU7uZiGpVuQ/KupjMA7xa0BGg4meE7XTGJAZd1aAzoYchmuNdCAC1rMeY5XJ6KPH+I/pfnT
	UtJiF0+QGmnzsxqDpBBQ5rDZUoSYDWhIUzgMO+9GgKViPTTYHtmpU7LRCqYaXWstTmbPXCgfgW0
	6TkO9WrnkSbT0D/tc3k25+Yn46EP2Jx9W5r1H9OqsXs0+nN9NV1JTqbAxJIdk+CFrzplaPRUVJs
	66IpE4RT3I3yzS+ULI9R9V4QfHi0HajM=
X-Received: by 2002:a05:6a20:12c2:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-35dd477ab1cmr13265301637.36.1763481027356;
        Tue, 18 Nov 2025 07:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5ng23rwmHIJYmLR06Sc9nwZMuuGePvJsiZSqPVwwwfbpDtLgBhoAbad+nB0Oxat0Rs84QwA==
X-Received: by 2002:a05:6a20:12c2:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-35dd477ab1cmr13265267637.36.1763481026791;
        Tue, 18 Nov 2025 07:50:26 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc377039a55sm15303159a12.32.2025.11.18.07.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 07:50:26 -0800 (PST)
Message-ID: <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 21:20:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
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
In-Reply-To: <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyOCBTYWx0ZWRfX0FY5sD/HDGse
 i9vDFXZbLgezi5uZIAziD6NdgmYYnuzF9wESBpEgpdzuN5/5EPerJDCf5NmCDh1j9e0Shp10n8G
 XA0dwFyFiIrm73jUZJ8A5V/5GtFM3nv4VcV6G7wcJdpGljHAobv3DmpMPpFY03x45ec45b9X4wk
 XeJfKkqk1ULKdepewCGI4qQFnUQpTuWP/TWJGH3mPQ4jXY9Emj6X3OqcVr9qY+4nalZ8RFKOe19
 bq6hKiqTGenjNpq8M/a+DSKKVqzGqckbrNetUcDF4gOduKm1mijihyluxMynGqJh6I9keOAUE+U
 yzQ8xrtLnr42+phpONbiiKTqhb/3tO+Y4fwl0PNAomvPR0OAa7aU/znsoGK0YsHDsIINaPYR6G8
 IOLEo3caHXOHe/ji27LllFbt9pujHw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c95c4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=ljhEWKHHbfLDow5flG8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 4AKqFgPN4xHuk7-UhLk8h1WSl4q5djAn
X-Proofpoint-GUID: 4AKqFgPN4xHuk7-UhLk8h1WSl4q5djAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180128



On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
>>
>>
>> On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
>>> On Tue, 18 Nov 2025 at 16:21, Venkata Kota
>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>>>>>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>
>>>>>>      Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>> dsp-fw-kaanapali
>>>>>>
>>>>>> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>>>>>
>>>>>>      qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>>>>>> 10:20:00 +0530)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Venkata Kota (1):
>>>>>>          qcom: update ADSP, CDSP firmware for kaanapali platform
>>>>>>
>>>>>>     WHENCE                      |   4 ++--
>>>>>>     qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>>>>>     qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>>>>>     qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>>>>>     qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>>>>>     5 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
>>>> The files should be covered under LICENSE.qcom-2 Made the change to the
>>>> WHENCE file to reflect the same as below
>>>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>
>>>>      Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-kaanapali
>>>>
>>>> for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:
>>>
>>> You've silently changed the licence without mentioning anything in the
>>> commit message. That's a no-go.
>> <Noted> Made the change to the commit message accordingly.>
> 
> Could you please add a word about it to the commit subject too? ('update
> firmware for kaanapali platform, change the licence')
Updated. Please Review.>
>>>>
>>>>      qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>>>> 19:45:11 +0530)
>>>
>>>
>>
> 

