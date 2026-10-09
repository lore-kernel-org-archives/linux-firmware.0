Return-Path: <SRS0=jNHa=H7=oss.qualcomm.com=thirusenthil.j@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7B8CA6019
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 09:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 576931F00898; Fri,  9 Oct 2026 09:36:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791538571;
	b=nZfRTRFkrrgfmqo+sT9LijP9DS2zO226Ar4rgkSyzqCt5iMzSy97RkpKC3+w8cH6Q5Tv
	 WLLo77Ca2oVG04yqY/o+JBJafas0ak0rZQiMYFCvTaaRx99hJDJ3oYGpYy+X/NJ/lzZmN
	 zokc5soA6xqYAuG4fOa57b++gWeMcz0B84rKGM3knBEAJRdeSnMECEqmjqjSzfEOE/EK2
	 O7K8NelXVYq2+vMqUhSNPeVKB7vnacjn+hWILxw8F1UKC2j0Yjd9II5tjy1JDQOXnnzv5
	 8QMtk/kta73LISPTsPNMVSK4NB8X/KDBx1Vj05YklgS9lEFggfuSlPm0z6zAvchGexw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791538571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:List-Id:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=;
	b=jJR7WFA+28Xr6ZW7v2oobcqYLlyNXycgpAr3wsgt3Rt9lwhO/ikTWEHUeS7cjiWPezyM
	 Am28X9sDEFK2w5ovE0g7fcrCV5H3arOSmalrjb/axdiLA1f+Q7+NH3jGwSocyXSifGSKo
	 4U/ECcgMybonVvlT10QeCwstfEvbIt0h0AR1fk25Gt1KvgEflq7+zZwvppDIoEuy2DSzU
	 532bU8KJs2Fcp8cD2/idMcVvkf4Dyrk3+7MXD7gziDdj9f/YeYzRymbN9OWsJn5MJfFSj
	 6u4p1WVRO8jVqh6gUugc8Gn1s8dRLkATrguzDU26hkSeQ2xK1Gb4Rdgwwi6HsX6WCGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eu8AIJwP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DwO6uO46;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94A901F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 09:36:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eu8AIJwP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DwO6uO46
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 94A901F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KJDK404416
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 09:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=; b=eu8AIJwPvLjTmR6M
	xNWZl5w6mNhU0iZInYiIkylr0WMcnC+5+9zvY+it1UI4VbBUQ9lHllZRb2LJdFrg
	DgQrijrOb/+HAq+xejf0B1tfXiRmzW4VjRalGTbf+lIfSwG9eXpVkTO4k5JFwMGv
	PWTkfO4AdF/fiINg2kaiGoLdqIVLX7yB+6ldbp9e4QxMDNFejjfMObfVHFX6kRGt
	oXg/H061y7Ht7YieKyCBkAWwaz/OPfM/e/Ug9Mc9mGHv5hB2C3hFJw0F57e6WWCo
	hsMhSt1d4jAtAlVJdloeq8pNZNDJeiDFIXJOFGPrlLNc64qh02JCcgSjqCXTYfm4
	n+KIeQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2xp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 09:36:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so48928975ad.0
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791538569; x=1792143369; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=;
        b=DwO6uO46VAf6VPGgiB3iQY/kXlhqoDmV99Hpg5cFvfRvRtyTTcbeV2u4kdZ7981WWV
         mOQbgPV4TKVrIQMza3Uxd7JYGKSoPXHZnIGI6XyH0ulTC/mq4iFMXEI2Gz4r/NC/8uwY
         kZbWyRyZh9h+RtC014UcBbOwZ5kkT0IUSJDPBvIQzicOaxLe991zP0VgJLh+83NsoASx
         RQzwxg+N+/Irp4c6234SaGYWp4yomznLNp+ELpm8ZDG9nWO2xVgFSdFwHlVl0SA1LGe9
         s3jHh5s0XI+p26CWCezN+/ta2dhmG7ZutzbN9XLa+oMjYRYSBsamtypfn2TcavWbzyjj
         o0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538569; x=1792143369;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85qlNPdEkcYw8yOFY5LRdai4t8d5MyM6OvjxC0Qsdug=;
        b=RyYQ7amHYFKHRaQ/upYhEaDyuoi5yvIEjrnz0LVpZmvo71R0Qp5zy/LSU3peFRwUCS
         Sno14nMRWZ8NWhuVIB5lLX5A3gngMMWDDYG0ZJtydZkaXGErqNvmgxSVlPbSbtI7RVzL
         ZA9WlZfFDsfuNIibjsl/mVYmbCD0DO4zdK9iFvvaiuHzCfPXayM4BopQysmOD8+SBLpX
         JI91KNYnY82o1mFsBx2xq54m0ELhZ81EItC1f6QuK8xMhSB8VIZPvUXfuxqcqZJmGfK1
         h2LoHV+yP9IWs30NUsxSyIiA8CrmJoSqywbF0yIBfkp4gWYym/NJxtJH5GbHPjmFplRE
         2j7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz9YuZwj2R2bGCqBWXcqQUc1VbRNOSRy+hLwozngujG9KgGX9EygXLU9YiVdAvpYc4Cr/8KLPIJROljoQzQFg==@kernel.org
X-Gm-Message-State: AFq9FYIhNyI9aFXRuyhl4pOKwT/h7WTRr8W78mr3omJSgsq0isuc0AbJ
	jgmhXOQ8DhAiZ+lHYGhBSjOJ+woNqvz73vLC6dNB+ZbCqsp3zXrahXRTviPDnUd3Jyb57M0vQgn
	MjO+kHk/GVTNCkAQfZxS++KYUWCvKjMfYCc+6HnsXEL01qfzpugDgZVDEv2q2/6c=
X-Gm-Gg: AYBFou0eIkyMR8dLMihEGh7ZZeLVO6MxddfNQphHN52Yc+aVWheR5xW+wOdecoVo8oy
	coGeVGI1UEh9gzJmcreVEpVMW9KSkB2Okev6JnrlIZjFPZBw1UGNM6t4Oa3LvMsONQvyThMerxp
	BXSLkUJVYG0uH/LvAU+IRD9FXQ7ctemAY4ANhiqSVAz3a8Nx1UNPyWcVPoxIHAT1z+qSSTrm9u2
	4lGfcOT7YHjRqnyeDpoDNC/Wy+sJKzD3kUwOkP30L44bUUhPOWibFI16HhjOFvRZnyvYcqCDcyd
	m0oWKARCm/57mgy74BX2hFgj7bcXsWUN2k6p8jkFeDKjaqowRimqBlJG00ZBNrEOC6ic17tPiLD
	q8KuFWasaLoePQYGk7A6oQNuw/goYPqs74g==
X-Received: by 2002:a17:902:e545:b0:2e7:f0ba:244d with SMTP id d9443c01a7336-2e842bcd14dmr10477915ad.36.1791538568927;
        Fri, 09 Oct 2026 02:36:08 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2e7:f0ba:244d with SMTP id d9443c01a7336-2e842bcd14dmr10477695ad.36.1791538568346;
        Fri, 09 Oct 2026 02:36:08 -0700 (PDT)
Received: from [10.152.202.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421a1de9sm5869695ad.26.2026.10.09.02.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:36:07 -0700 (PDT)
Message-ID: <443818dc-5555-4f65-88d3-6876505baae6@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:06:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: inconsistent regdb for QCN9274
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-firmware@kernel.org
References: <ap-vTGZiqGaodxKE@FUE-ALEWI-WINX>
 <70e4a7fa-6595-46da-8465-38906a41a6f3@oss.qualcomm.com>
 <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
Content-Language: en-US
From: Thirusenthil Kumaran J <thirusenthil.j@oss.qualcomm.com>
In-Reply-To: <art3FqNHatt7zjLZ@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac8b589 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KmqpvK4wijeBTWolkK4A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OcJ8EvoJgQNsAuEO5E6Lz8GdT7s21VjC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfX8Gsy7/ESZL+v
 nTd3yfMucKZs6lk5lOxpEOkadTi2TbAOZJxZfo91EVOHTOJ42diQqrQu09WoVsvURl8Vojq7iK8
 Ahq7kdcAhw6lHIkhrbAfzJxnMZx3aoY=
X-Proofpoint-ORIG-GUID: OcJ8EvoJgQNsAuEO5E6Lz8GdT7s21VjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfX9KtGosSHGKqD
 +XlO+5/AuJjh12KOn7WCds40JomscVjTdc/6F1dyCxHTxJJTIME3vQBDpeGEiAi/yeNXkMfvBkT
 oIi3/UmglHZwtmCOop2tRlPzR8cJ9Y677R+1IbD25o0SHjMwiJyD3rv24U6btbUXITSuDcYlsN4
 xsFGeSWsjgSZeYpW6kX8KilEPEqRipZUzX0EcSjj4OXieSGIaEXLXv3Zy1MLFSjYbXtk6z2UEw3
 iOU6Po1LPTtABlY8VhvTTvEy+UPrJOyiJ0NFsLrK8x2qy6Ue4vkA3fvVTJVbsx7uowlwKKDv0Vv
 dlXqtPS2ULL7iPI95+07z1HZ5t0+Vi1lErpC7A0lA/V2pXLjFflJhUhFfiFyAGnSdmOOA7pfahe
 cSzNynu6HD/8C2vEEeSqv4SNbWBfx+hmxoL1grCa4MAE8lOXCraOb2m4J8rFHZShTmChayXo1/W
 +5dmes/mYeKEN3Tc6/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090038

On 9/29/2026 2:00 PM, Alexander Wilhelm wrote:
> On Fri, Sep 25, 2026 at 01:36:39PM +0530, Thirusenthil Kumaran J wrote:
>> On 9/8/2026 12:16 PM, Alexander Wilhelm wrote:
>>>
>>> Hello Developers,
>>>
>>> I am using QCN9274 chipsets with the `ath12k` driver on my devices. As far as I
>>> can tell, the driver uses the regulatory database from the `board-2.bin` file.
>>> However, some country definitions do not appear to be fully implemented, as the
>>> values differ from those in Linux's standard `wireless-regdb` repository. I even
>>> downloaded the latest `linux-firmware-20260810.tar.xz` and do not see any
>>> related changes there.
>>>
>>> For example, when switching to DE, I see the following values:
>>> * Channels 52-64: 23 dBm; I would expect 20.0 dBm
>>> * Channels 100-140: 30.0 dBm; I would expect 26.0 dBm
>>> * Channels 144-173: (disabled); I would expect 13.0 dBm
>>>
>>> US also appears to be inconsistent:
>>> * Channels 36-48: 30.0 dBm; I would expect 23.0 dBm
>>> * Channels 169-173: (disabled); I would expect 30.0 dBm
>>>
>>> I am aware that `wireless-regdb` is intentionally restrictive in some cases. For
>>> example, there are rules where 26.0 dBm is used instead of 30.0 dBm because it
>>> is implicitly assumed that TPC is not supported. Therefore, some differences may
>>> be expected.
>>>
>>> However, the values above still appear to be incorrect. Could someone at
>>> Qualcomm please investigate this and fix the regulatory information if it is
>>> indeed wrong? If the current behavior is intentional, I would appreciate an
>>> explanation of how these limits are derived, as they do not seem to match either
>>> the `wireless-regdb` entries or the applicable regulatory requirements. Thank
>>> you in advance.
>>>
>>>
>>> Best regards
>>> Alexander Wilhelm
>>>
>>
>> Hi Alexander,
>>
>> Our internal regulatory team is reviewing the source and rationale for
>> these values. We would also like to confirm which BDF was selected on
>> your platform during boot.
> 
> Hi Thirusenthil,
> 
> Thank you for your response. I am using a WLE7002Exx cards from "Compex Systems"
> and have also received the corresponding custom BDFs. I then added them to
> board-2.bin using qca-swiss-army-knife. For the regdb, I am using the default
> version that comes with the kernel (the one with ID 255).
> 
>> Could you please share the following details from the affected platform?
>> - The exact platform/board model, or RDP number if applicable which is
>> used with the QCN9274.
>> - The complete dmesg output from the affected boot.
>>
>> In particular, please include the ath12k QMI target-capability messages
>> containing information similar to:
>>
>> chip_id, chip_family, board_id, soc_id, fw_version,
>>
>> These messages are printed from the 'ath12k_qmi_request_target_cap()'
>> function. They will help us identify the chipset, board ID, SoC, and
>> firmware version, and correlate the selected BDF with the regulatory data.
>>
>> For a quick filtered view, you may also run:
>>
>> dmesg | grep -i -E 'ath12k|board|bdf|chip_id|fw_version|fw_build|soc_id'
>>
>> With these details, we can verify whether the reported channels are
>> included in the selected BDF and continue investigating the regulatory
>> limits.
> 
> The wireless modules are running on our in-house board based on a PowerPC64
> T1023 platform. I am using OpenWrt v25.12.5 with wireless driver backports from
> v6.18.26. The board-2.bin currently originates from v6.12.94. The dmesg output
> (without debug messages) is provided below:
> 
>     user@host-A:~# logread -e ath12k
>     ath12k_pci 0001:01:00.0: BAR 0 [mem 0xc00000000-0xc001fffff 64bit]: assigned
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0002:01:00.0: BAR 0 [mem 0xc10000000-0xc101fffff 64bit]: assigned
>     ath12k_pci 0002:01:00.0: MSI vectors: 1
>     ath12k_pci 0002:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>     ath12k_pci 0001:01:00.0: memory type 10 not supported
>     ath12k_pci 0001:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1005 soc_id 0x401a2200
>     ath12k_pci 0001:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>     ath12k_pci 0002:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>     ath12k_pci 0002:01:00.0: memory type 10 not supported
>     ath12k_pci 0002:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1008 soc_id 0x401a2200
>     ath12k_pci 0002:01:00.0: fw_version 0x160484db fw_build_timestamp 2025-12-09 20:09 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
>     ath12k_pci 0001:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
>     debugfs: File 'ath12k' in directory 'phy0' already present!
>     ath12k_pci 0002:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
>     debugfs: File 'ath12k' in directory 'phy1' already present!
> 
> 
> Best regards
> Alexander Wilhelm


Hi Alexander,

Thank you for providing the platform details and dmesg output.
The logs help us identify the two QCN9274 devices and their reported
board IDs. They also confirm the firmware being used.

As mentioned earlier, our internal regulatory team is checking the
reported TX power restrictions against the regulatory database and
reviewing the source and rationale for the DE and US entries.

Since you mentioned that you are using custom BDFs from Compex Systems
and added them to board-2.bin, having the exact final board-2.bin or the
corresponding custom BDF files would be very helpful. This would allow
us to inspect the hardware-specific frequency and channel limits and
rule out any issue specific to the custom BDF.

If possible, could you also let us know whether the same behavior is
observed with the unmodified default BDF? If so, we can continue the
analysis from our side without requiring the custom BDF.

Please share the dmesg output from the default-BDF run as well,
including the board_id and firmware-information messages.

Best regards,
Thirusenthil


