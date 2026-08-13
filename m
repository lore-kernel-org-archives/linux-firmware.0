Return-Path: <SRS0=B8UX=GG=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7071FC5B572
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 10:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D0C81F00A3A; Thu, 13 Aug 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786616821;
	b=lUl6khlOJLUb4lBUJXlKzPAM61F62ijAf3x9zt3FascgXyGeKAZS1B2Yt3DjtEnvP+9Z
	 C3f9LakiAadPf0RJK7FxBGCcrgTtUKE8WzsZmmR45k57Nm3g1qzqWOr8jSOmKy6ZFnAw9
	 z4vMnL/SCLjaJbFf51FrYE1aEoQneFLwqOCOIRVKMjoYx9nYd6HQF2WhZY0hsbIwFXfV1
	 VZwdRmQUWjupUhhC56nQ8MNKg24fMqoakj7ovdDOh14YdizENpaq7maIfFkoWWMnlRRQ4
	 kFiDx+ySdtstz6NaSS01ucWHnLxlOsjPcDRXrLWvYE2KySVY1hqpZmdaa5InHkcisFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786616821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=drYrO14/knKMexL6zFcdb+tzYbKv1jAKAdOTlI6h/3U=;
	b=NDZ+LpEhWVbrRcyDcKDKmp2ObtxVA7Dt6CMshKzBV1oxZLGDvRADDMbA4fqSzTvZFTz2
	 v3Sbdk6bOYLuwXnpEkP8XD79zHUi4AE2GNi4Ypx9x94rKwUsV3aSbAmLY3yJfQj+01Ehw
	 qCOm3Myhd4v0mnKTMwcYiiJRIjG/ZGso9/fLOS0Lv9DIqXGfA7jav92hY0dPth/sbEuXA
	 J9nhIp/KNF9DhVjLClxR5xElezmtnlerOhtpZp1PSJdcHZsVhElwQJDcQm72/ExVfkWfc
	 sylLG7kaN9SnGFx+BMlzHgw6zjFnpr6UcEdzk5fOenyZbTLjolY1UWyfTdvF2pA9hqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GRsvesuC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWbUnbbZ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD0821F000E9
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GRsvesuC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWbUnbbZ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD0821F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D91xvC3421796
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drYrO14/knKMexL6zFcdb+tzYbKv1jAKAdOTlI6h/3U=; b=GRsvesuCFpernyQh
	Td/tp0VIeh3kqaf3bheBSLVa736UH5V9xv+0NmTUzYljFW1cr/x5t5om66aRMrqL
	Xh2j4XWFBVPp18Takc5HDkkSfaMK4wFbt37dHokqGK/Tsk3bSRmP0tFch/s5Rlym
	3O8CIBYAdEcxA+ZCpVCj5GdHfttl2Qbwqj24e1N49oCWybHPecHSaqiL5nWd9+wS
	3YnTqj/5uFdWu6piYPLqh3Vss/Ho2SV/DVgqVn3oGlMC1GUkFM9cgq0W94m4iYQg
	8rqx3Mu6Bn0s+y+HQos+zAQuGS+IOK+k80wYrxBvQknhmXjWDjDkyoWFhXHU/7Dg
	WfD8Rg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152m9t2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:26:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484b9fb055so4457643b3a.0
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 03:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786616819; x=1787221619; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drYrO14/knKMexL6zFcdb+tzYbKv1jAKAdOTlI6h/3U=;
        b=BWbUnbbZqCOzqgPoPB/zu/wSkcvDsPTBUjPmBlIuEFBVCWB/6QDCVS7LlygJ81aqs2
         DHV7m0xKWQPSkl7zXc++jLfP0qx3QqXGLBpkZ9VRCaUherY/2MxDDOskjq/Rc6YCyknR
         8ll4j4YHUXhAZoH/tEsOwGBZJ1XXGRyhxcsENg5Qnbqh5t3aHByGmw7PYTbYILEeTFZ+
         Misa+FrKeHVEgjY7Ir7O9aZ38IkC5xuWsNo18kiPr9hISNkKrg+G0OMB2zH4IqvgD0FR
         KVGuge5rM4yY8xpWuEbE7MYjawQmR7YHumY4iYJNFDsQRtUW/4ohhlARaX8Zltb+VzyW
         BurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616819; x=1787221619;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drYrO14/knKMexL6zFcdb+tzYbKv1jAKAdOTlI6h/3U=;
        b=q0t1yHzRS4oE8xHRL4dQgW4JzD+FNEPwDd0mHmYQ71YVLH6091lHpRdW9yLY82g+4W
         /4O9+Y0hhwJ93l6qvfM8qdaMhgv3XP/JL/0wV8gZfEuYltHWls2LcFXSK4Auhj48o044
         T7bB3WrWELefFrDtsmPJjwcLouHopy+u8FafUV97ExeH4i+PFL3xK0LMkcf40rIMDaLU
         L0c1mcBuA1UTaJeRy1llkx2agP546kov9biBYCik1AZ8gsC2lnZjxVzblU5k8MKzxcRP
         QOZtydn/TNT37JKfQjKIiOJRPMMLqDLgCcBS6nc6mjXkNLBGgK7M6/FXx85G6S5uXDfc
         WeSw==
X-Gm-Message-State: AOJu0Yz0L1K+muM8sWVoQE/dpihMOGudyVOmeWhWKz1x/AjfT8Eqi1vD
	BMQm/3ApwRwnHVeTVQZHEt6Nj0P1/tNTJBU+nVjwBLZ4BtEykXoYfjMTSD9G2SeCOpb0XEEpkkb
	KbgwTF1HfklorAGXjJ1NxLjxdvBk+SdUa21NfwxV2Fg3ZJlWc/8o3h/pB+2rv9aA=
X-Gm-Gg: AR+sD11MQoUmKJy/X1sjoaZI6yS6w4n8wa/sW71ceOkCsYIZ18ClbXRSVeHcDvVAlFw
	iG7v1xHacmcsOn5Jg6CwXaldsoBOOsG8C4OuaEnuuvWvHy4ILFFmwRIVgSMA/J1DhL1zxFUKT33
	VlbwqdV3bn751Z620HXFCDqTHameXvlRPjnh2NxMQDQjfPN1E+w3AFLnfC1mJN154RgHhb2zrDn
	x/Qcf6yRZela1OL1CUsQKLPi7/X8i1MQnP2NjsKhRRjVgO/cO0a6aRE8/DbVn79NCEO9bLAMlg7
	CHw/LRq5cgRQdboSeQqgS8nsYpLjHhJOaaTTCDJLcYm66oJwwkUEe9EV4Zw0sPEn7jGt7u38feT
	AVPg3nHV6UgfnkEf+vYr/3GFH3DLw
X-Received: by 2002:a05:6a00:2999:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84fc6dc62cbmr4634277b3a.18.1786616819348;
        Thu, 13 Aug 2026 03:26:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2999:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84fc6dc62cbmr4634230b3a.18.1786616818753;
        Thu, 13 Aug 2026 03:26:58 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a54b27sm639670b3a.45.2026.08.13.03.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 03:26:58 -0700 (PDT)
Message-ID: <48254a82-1d82-44a7-8717-0600e1de87ee@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:56:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add NSP firmware for nords platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
 <frgcq2r5bogzqtv2ft62btse6ns5iy3s6lfebes5iskrposcz4@hezpjlc4wgmd>
 <2c91a37b-77d2-4894-bb38-e6dfcc882f36@oss.qualcomm.com>
 <3qw35vkk4cqdop2resye6hirjjnkxrk7ceb3cctckpduu47vsx@dr4f3g6jdmbv>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <3qw35vkk4cqdop2resye6hirjjnkxrk7ceb3cctckpduu47vsx@dr4f3g6jdmbv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3MyBTYWx0ZWRfXwseebqEqGxgH
 0/rzX1NcKmQGyy1lUq/rbdFrz28S2HxLNwq8Bu9PEfHsjhtus6yiuxSVQRC1szXa1a1GUwQj5Op
 s4UmYQGKiI6Jy8fCawCSezSciUYQOqI=
X-Proofpoint-GUID: nbto28bjfoclNMK8So1oIeMJK5tpNO8c
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7d9bf4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=ZuMHkDu2n5smZoxnKt0A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3MyBTYWx0ZWRfX46Gan5zEUXJ2
 4Cbeg/jLtam2H3zf6dgbVECdgdStzj5eytnuhJaa+kJQ6jvXg08W2AzHLRdWJi28/bSeEQTotkU
 br867+TUwGxIAhUlwD3i6SyWYgRRbDLnhHy7K3SzMeM8iAZKjXQw4EduYBGtWNGZuDgAHSt3vSh
 FQxbyHbVnpwcDRuxBVIPWGBYS261lMtych64EvJrkdt+hKuCl5Ei9MH5t8B7UyoA3kvhkrD90e3
 nOGe8liEp+Q5DS250x/RhTnP8sULCtKOXV52DYLvJNa+D2zKpSJ3GqI0lWnpKzKc58pH7NxFVoF
 HMcFPNBQr9qt2y97CiIxKw57EFGTWuh7+8O6i+SbQpTEU22An/MphIDkV6aMg76MDAYkihngP4i
 V1ETcRWxbIzgbPQHUllRZO7FuHsIfTTs5wHUjK+wfQzVyi18OTZWTKQNv2rRBiGKgXQmtJXtCdT
 fQFuED4ByjD5PONV5uw==
X-Proofpoint-ORIG-GUID: nbto28bjfoclNMK8So1oIeMJK5tpNO8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130073



On 8/13/2026 3:20 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 10:16:57AM +0530, Venkata Kota wrote:
>>
>>
>> On 8/12/2026 5:48 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
>>>> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
>>>>
>>>>     Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dspfw-qli-nordsnsp
>>>>
>>>> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
>>>>
>>>>     qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
>>>
>>> Is the firmware for those instances that different? Can we please have a
>>> single binary for all four CDSP instances?
>>
>> The firmware is not different. However the signature on these images is
>> different with each image having a different SWID. This is a limitation
>> coming from TZ at this point. There is an FR93715 on TZ, to be able to use
>> single signature for authentication. This is TBD on future targets from TZ i
>> believe. Till that time for our QLI meta to load this image on available
>> NSPs different copies needs to be there.
> 
> What is the ETA for that? Will we fix it for the lemans targets?
> 
> Having 2 pairs of images already was questionable. Having 4 exact images
> is a definite overkill.

I do not have an ETA. This FR is on a different team and definitely is 
an overkill even for our team, I think for SECA, the next target the TZ 
team might come up with a new authentication method
> 
>>>
>>>> ----------------------------------------------------------------
>>>> Venkata Kota (1):
>>>>         qcom: add NSP firmware for nords platform
>>>>
>>>>    WHENCE                   |  13 +++++++++++++
>>>>    qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes
>>>>    qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
>>>>    qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
>>>>    qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
>>>>    qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
>>>>    qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
>>>>    qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
>>>>    qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
>>>>    qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes
>>>
>>
> 

