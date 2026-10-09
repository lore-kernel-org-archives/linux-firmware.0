Return-Path: <SRS0=v5zq=H7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DD9CA5FED
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 08:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 078621F00898; Fri,  9 Oct 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791533006;
	b=Gtoa9J6ITys1QDbxEgh0jX4Q+NUDeairdZm9uVhFOMAiW/5YlVuMX65htQ5qrfExno8h
	 bfNZDoLhaVCArP35mM12FTJpRxzHxG+f1tTGk+PwfV+BIT9R9WIwfQpwhhQu9InfzuDf3
	 kPA9ceb0R+Sl/Tp4A1ltRfICXDq1w4tzDaJT3Ue2TyULU4WJZFkmDtJtakCGJ5xVuGP0i
	 mXfo3UGnoFL+vjftMmmBIK8aRmpX9EUrqHJxol0iMbo/md1odXiLYj+PgwACLKe0c2ODh
	 0ZG7KhMfAyQi309fqKy/8XDuIDN/PhWLA9F6yH9y6s1ZFHnZ+RtdrNsdEOxJdGqUSdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791533006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y5X/UFihoucQsRwJG/9IbWvJJ+ks9NWjwDjV6FouvA4=;
	b=f8xwT6BVOWybh3gF7CIz8FlR9LUAp3kBgjiDTknE8ljN8WEzKdjHr4Dwp+qJUmVOVSyZ
	 TNp5prDTJmhankqEtmTkdDAmBRAWcjfV/nwn2ORUbcj7nyle4h3MvmQAmhW/kNkLMbHcj
	 ZqeyyhSiKxpAI3+9m0p+JY8elcC3RRGVNy5kzz4Z8ZvImxEFccc+pXKQoJcvms1TaTDdF
	 jvqp77da+XCxHt+pnbvfK2n7FXy32pf/OveqPymMBQkmGDNbR7P56eJJjeflpl5Cpxj7n
	 2BjBENoigpzGeF0JX/cUYItn1pZn4+Rh1o65ww4IdsieGmqYfdB0zgZDr/YDy9cTSeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbEudu1Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TbOTEylS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58D761F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 08:03:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nbEudu1Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TbOTEylS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 58D761F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HA4e1598043
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 08:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5X/UFihoucQsRwJG/9IbWvJJ+ks9NWjwDjV6FouvA4=; b=nbEudu1YtjcJghx6
	AAwDjYZg8RAQ2hx6Q0dgjzUu0REeswQhFvzzEWhYT47FU17uZCC8l7ZIXmDFoj8f
	sp7MsOpEBoVBgWmXlyhuhug017vRPCfdcrb02CFNFtrosT8UihlLkbc4AlJxpQTQ
	HG5mf6HO+1TJdI4PCMtT5idyWHZTNhz2ZXeSZFqTiVb3eCA5VvUflnl5aS/lBxOB
	igYReYEGKIoWRTIIChOJ9ZCyKU5Oa+7QsIIGadm2rxTIC/x2gRXFL60ds3HnLI2C
	5WmsP04SZd5UFO4iI1kxC+FHJEtFuYlE2lIDos7hAyjlCz6ShekyunWa0c5i0B5V
	Xl7vcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufscpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 08:03:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so2047275a91.0
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 01:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533005; x=1792137805; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5X/UFihoucQsRwJG/9IbWvJJ+ks9NWjwDjV6FouvA4=;
        b=TbOTEylSYBnuvg+L/zjxcOkDkMcYqs1u1KId+2Samlsv5Az6yGqLrwnHggOXB+qOl/
         R+cEJo3JPP3oaRYH90J2K7Xptt+NeoNoF80yngi1mMKQJftN1VD36z4yZAcaTtX5t8yw
         +doEFngWRfXDN1gmaBYy+ga9QKRTQ/aWJFpT7hve66UAqogbBNOTNBXGFtcbJhEvVZry
         P8uxS7Z6SzcF6haDOcwqgwMgImAYLP/DUaMUQXzKm3DicHaIMWyVSgW9+hvlV/1KzekM
         aAx50IZQKvPLBakRMvAgUkAi1FJBWL7oVgjweLFzc7zxHlnhxubmCJshLNjaugnkgRcr
         6Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533005; x=1792137805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5X/UFihoucQsRwJG/9IbWvJJ+ks9NWjwDjV6FouvA4=;
        b=MGDnxiOHRebUYceYZA1xXeO+niNswyIb/oIISLJtOB6GTKudfs943G1PttAxncutRe
         eMqNp458SbqweX0ODJDu/cXVznhrGp1pQ2Lwc50I542Vfx47UaJeiXH2WwK6TeGns0Mp
         rBFkj3nd12eUosJpqHDnsXgN9ism1sYFr4NZ1hgXj0SjLfNAfw61qkqxcPBqNPmF0HlN
         JjCuvMhUWkZzQiA+FNdqGkxPE947JJGleVEJiJw7IIbJBIB/7fV54gd3rm5iLzHFYrc/
         noXnZLosiQ+cklk3GY7oiIwUEAELl0kLg6s3tuCGXtVpZQCrxMan40Uha0373j/MJkoZ
         xkkA==
X-Gm-Message-State: AFq9FYIHq84ZAxIpj4rfWfXEu2ohHm1qBIhEl71+NMuDMds947IPcD2L
	oQvVWoJapgb0II2xSE5HiyfPzHMS1vbHr94GYWPmc+nGAMwAgT9GnPH4OsmBgm41q1bQ311alh4
	r56KfQaZgLppFHw5tuOy/8bRE32L5Esan8cXWAhpiA6wnPCOST1gOAKUYhL/rrh8=
X-Gm-Gg: AYBFou1b2md9S/rOfw+Wnu1Z3fW4DTYDy5I94g/2JgPGcXcFBUdNP4vaV/oKiMNXipg
	130XhWkYyU+zTACHX7bzaRX+h5vherlvvSlybL5n2GGJdEqku7BKr24I4RcjQE7akfNJpd3sUat
	dUdmIaCTXV2u8PYrXB0/a34AO2UtgAkGFtJ+GU6wA1r7OyNP6zC5OoXJ5kpLHwl+TWNDfTjqzlO
	6Bk7eP5/eAfJxYYbh7HCHJJ9P1va7fOXFgJT2vT2ybs8XsOcWbUIGEfCq+kruusPozBbwM4VVJk
	lnQ1g9uT1MlFgKdMlfpyZVjLCjQpiCT2MtPMJsa4FylmgM/sxfMAyllgY9u8jT4x8PQv5VlPrud
	yc8sku1w0qCqSs+ILpXfxPQBOWya0
X-Received: by 2002:a17:90b:3bc7:b0:3a0:e985:9ca2 with SMTP id 98e67ed59e1d1-3ab3ac6b9a5mr547194a91.31.1791533004743;
        Fri, 09 Oct 2026 01:03:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc7:b0:3a0:e985:9ca2 with SMTP id 98e67ed59e1d1-3ab3ac6b9a5mr547179a91.31.1791533004173;
        Fri, 09 Oct 2026 01:03:24 -0700 (PDT)
Received: from [10.219.56.173] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm2441495a91.4.2026.10.09.01.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:03:23 -0700 (PDT)
Message-ID: <313a4e19-3f6b-4ff5-8d0b-eaacde53c138@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:33:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update HPASS firmware for nord platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
References: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
 <bogjreespb7ntadbtdl5yhbhqkfbmi7edd267pr22r3depgbjq@tth5ymlascdr>
 <d281437d-96a8-415d-95e5-ffe837cd4a0c@oss.qualcomm.com>
 <oqbhmu2snqvlqqqve27blva55hqgc4fs5g7vtu2ktutudomo3m@2ug4kvnniuwn>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <oqbhmu2snqvlqqqve27blva55hqgc4fs5g7vtu2ktutudomo3m@2ug4kvnniuwn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac89fcd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=untGDAiKaLtLh8cip3UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX+c0FiMU4vc4b
 zYC1tO7C7Z/QZ3sjFbknJUGCt3WTqlQi3M600u+Gjb0JDhHbxOtYAt7hyVMyzisjIkf4tcJLBVZ
 6E0mypwMPNUYq+XN7RsHoj4g5hBa3lg=
X-Proofpoint-GUID: SlgvWg0rwsXcFIPbysDI0VAetl0Sl-9a
X-Proofpoint-ORIG-GUID: SlgvWg0rwsXcFIPbysDI0VAetl0Sl-9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX9X4vUUWfTbR/
 cYP0Z2BxLTD97v2louJUcVqLfSkF7drgBL9ZqhugpU8qW6IhQtakzUI+cfTtdGE1nXBJnTEdOv0
 +XJpzA2usssudeoPQzywnZDM21Px087NSO0pPvWrDIvK9aKKHZ+1/i2N20Bqyj8ny3NSg1/USW0
 GYg7rL+/PGFLT+1XJzmtbyieKBIbRIhOsrZYpu2XNKK9O+nYFLT57LRgINzWn6g0kPn0MScPmxK
 bBCVqwmmTmWd2xdT3v6YY/y7rqs2G19wwdOnxgDyP1YZgMYYoTSP6Sr96ENJKH/W4XmIlGN73gV
 psOcchxlXWI5Uz4LAn+ZSnTL20lHRlHHBQ9o0BYcaLY1XCNHjnzuaNcgr8WJ5Iu6HMpuTQl6RQf
 poe8o1Pc84obNU4s06EeVuqrPXulTMRocaLqwaO4Ulr7LDLOTqQi7qVc+/4MmunAr0YLYpAE3U4
 Fp1tYnK5XV9olEywpFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031



On 10/9/2026 1:10 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 09, 2026 at 11:19:31AM +0530, Saddam Patan wrote:
>>
>>
>> On 10/9/2026 3:27 AM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 08, 2026 at 07:50:36PM +0530, Saddam Patan wrote:
>>>> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
>>>>
>>>>     Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-hpasslatest
>>>
>>> fatal: couldn't find remote ref dsp-fw-hpasslat
>>
>> dsp-fw-hpasslatest is the remote ref name
> 
> Please don't edit the quoted text. That's not what you've sent. From
> your email:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>    dsp-fw-hpasslat
>    est
> 
> No, robot can't guess you've inserted extra newline in the middle of the
> branch name.
> 

It appears the branch name was split across two lines in the generated 
request-pull email.
Can this commit still be picked for review, or should I resend the 
request-pull email?

>>>
>>>
>>>>
>>>> for you to fetch changes up to 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856:
>>>>
>>>>     qcom: update HPASS firmware for nord platform (2026-10-08 19:47:08 +0530)
>>>
>>
> 

