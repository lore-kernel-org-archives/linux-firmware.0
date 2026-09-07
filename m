Return-Path: <SRS0=/E5r=G7=oss.qualcomm.com=xiuzhuo.shang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D9C79FA0
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 15:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B55781F00A3E; Mon,  7 Sep 2026 15:00:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788793207;
	b=G5cT0ZUBHCh07/e8N9Z5lqkStshEK+SssorfapQiqbKxWOzltHqCzo5UuhzbBPkUwo6h
	 lQ1E7CQo5VxR2oyypxIhafOL0V5JZQXgVlA3V/qOYeOwgRJ+nkz0xx1PgJvASwVekFchj
	 lTX6aqolrzoHZR/T02ejetVRZls0gxXQpLwnZnC1eGDK4uErlpD4QLU76O1ohapfXYryj
	 35Zxs+VncnSaVnkdYw4wSJA6lPdL/XERamJnU4MAYDHNyY4PmFZdXDef5R5IYDQOwUGgP
	 /ovz3LLwsDbRzXKpRcHAULtb/DlZeKqa7cHXJPyK517vftZ6NXq/0pboJmum5CFiLWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788793207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Eikva4gq5RTgYuuq3HB5DOf/46ihhsJgLFaYoqlfGG8=;
	b=c63/q7DR4YrrRXUvwiE4IoUGKAvcSaCDPhsifFbRwvZSziRj32vfSTZRbmIcmyiGAvhL
	 zSAhPGIDv1vDMdZdZFD0WvY3ig+z3nKWhisG/p2QKknjQjGwC12To7czEdoFoyTzLv0MD
	 40DDy5bqEjRV213wVu3iIW/9El49Rrg2lLWEnBXgmGDKI7Me7S9nN8ulrsKR2I2sw3SXb
	 /JPJwi/sz68PAPrv47PDKCCeIzfJe1BtKKg9XRTtautLl3WywjXv3bXdVNZO/PFUCwIIE
	 +RnOcvqDzKVUg0AvQf0TtxOdJWcG+Qhtto6ZqqgcUYLnaaQVbFdmQ5R4KJE825fDajA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=guqoWoET;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViwOONhx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04DF81F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 15:00:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=guqoWoET;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViwOONhx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 04DF81F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdUw74149404
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 15:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eikva4gq5RTgYuuq3HB5DOf/46ihhsJgLFaYoqlfGG8=; b=guqoWoETOHulrrWS
	Lfi9M/AV6RSOQ8xldAtyHIbQVP1jAQhtUBpwWMSpTmvm95Cd/dY88IN/hdWzedGE
	sbOIpXgJ0rYX0D9sgD9QKXxWIT6gIMSyb9sukf8ov9vyQOOWPYxZdfgFkqWEoE2W
	7bTyaR8q2qJHBsyxda4gcGLrf6kg/iac2F3XP1SjfFs2fK40SW/Ouen6JROsicYY
	cBzIYXQUEoU9BR8vOU/C/gn40RmWYfBGsKT8+mlWoXCrPxstaGTFf8Z+RgvtXRHk
	AELhSV8+WdhQER5/s3KxJADAUehj3P254xjIXsB4OZnnYrZ5E+hb/+GEZByjF+Fw
	giJFwg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyhjwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 15:00:05 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-837aaa9a3f6so64146057b3.0
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788793205; x=1789398005; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eikva4gq5RTgYuuq3HB5DOf/46ihhsJgLFaYoqlfGG8=;
        b=ViwOONhxKQLaEnDT5+Y4FM3D5AAx9I1qlIIcDAx2OfwH7fQVLrIUE7k3unyghFZ/td
         ZRycY/JCdAWjAnOmni1BeIZyBnZTfvfzR2o9W08TKoG71YFdDXP+3P0uio6KC+qAdAim
         mCldJZiGOUlRiApMcOOaf9Mu84hR1Q+ISjw+EJ6x1/yD+v5QKur1bm0ipirL1uXsy6Eh
         uO92pz/QYEtQK8JvFRP7WGznhxGzs3haIVen6xcfFoVza6YV8MpKvKt3Rb1wvp4mIdpv
         1HMjGxruYS5I1glJyayvXxdbuIjPKxsIUq3UlfKfm+5gjsAlBwfBjJ4r7IeDSqD7BgOx
         l5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793205; x=1789398005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eikva4gq5RTgYuuq3HB5DOf/46ihhsJgLFaYoqlfGG8=;
        b=BqCMvPwB1yhHopzBL3Ky3+x5oOq4WONF1XYWICQVUREcG9oFqBa5/1qVvBn/jXDhgz
         8O3FWhGs85k+ZRfO3/0nWuaBGXaiEgWELkSwCdmbaWvmDPssmhP+r1txJxxswK1rPu1i
         F636POUPhMwOkYnhH8C2KYFXgFbVu7ImC6YCHMBSojV47M5vx8uBq9jooZrkerf6dQWn
         ftTyPe+HXkxn/7poQX/6hi/+4oBrp6rNyGEaH0GFcSNhHuDCh0dpxieNYsqJpAEkpeO1
         cDqBVGElnwUlNzMQ3uKV80lK6GfBIpAtkWgl2GBo1zq/KfJQpFDI/sptMREythcOZbmH
         JqoQ==
X-Gm-Message-State: AFuF++nli0Ow6X9b+4WxQcgVbMSIyUcsuFr3bM2mm7Oln+k1pUpPUc81
	dsnSOz5iWE5dHxyfq320+GcsAoALRPTmDTbC9hHAyPt1U92JkYe6+F6ZHok4chCFHJoEHEXUO7+
	q6s6hJNSTiJsskjj2Ne0ZjM4LG/BFHh+5a5fYZuaL+2iDjtxMxX0Onh7f97MS+RQ=
X-Gm-Gg: AYBFou3iuis44HnztnhgX4jaIVOqHHyhwpORWanrkhdf/DdvT9x5qdF3Nmye9MTxyjr
	XMdNf7OjUx6Xu+JB6ufpIPEVemz7idFYHoekj6xhSkbrXqSWPH0ymrToS72PuHcguXFY+qnMXsR
	ChK6MbyUvZytOdPpEfIrnve1eXQHfIEex+ZF0tNkk1XEfUUh8kygcRcR8YiQkaJVbsZWjF80A0d
	guei0+tnY3hFtHBhrKwtQoJ/7wipVdsyhZJoFI8A5gspmPPu7UvmUAhyxoTdwgQk2BePzkjoKsp
	DoalSXFbXkElYhA4Vvjo3FNnnbYZyYqiVAuNyJtIYuDX2cE+WGMvRgf/tLY/8KfPY0ug60JE4Ya
	1xjoEHUd1ZAKlFjO1oCVR9vA4OjmxzUTx
X-Received: by 2002:a05:690c:e3ca:b0:873:5c6b:a31a with SMTP id 00721157ae682-87c0cb058a3mr3937607b3.20.1788793205355;
        Mon, 07 Sep 2026 08:00:05 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ca:b0:873:5c6b:a31a with SMTP id 00721157ae682-87c0cb058a3mr3937467b3.20.1788793204886;
        Mon, 07 Sep 2026 08:00:04 -0700 (PDT)
Received: from [192.168.3.38] ([139.227.16.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149600f48sm73301597b3.13.2026.09.07.08.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 08:00:04 -0700 (PDT)
Message-ID: <9d9da832-45b6-42be-af8e-439c6b280744@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 22:59:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
References: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
 <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
 <ab9ec764-6f47-4219-98f4-7ba078500bc8@oss.qualcomm.com>
 <snasxsep4flqavgyy7cksr7byva7mhhpkfnvslij5crmlu3nv2@yva7f72k3yn2>
Content-Language: en-US
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <snasxsep4flqavgyy7cksr7byva7mhhpkfnvslij5crmlu3nv2@yva7f72k3yn2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tGp48DjOPARCnjEsbgeoS-vNW9ZFYmHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2NiBTYWx0ZWRfXwnxGcl4byoE3
 4kkCszi2f3DoQFptRMVqSvcOJyvznZ8pjX9ZREcG4RbeNqJOm4HEjOLg5dAnbeiReDQPntGYYAl
 Vxd847YzBdEEWKrOKoOHkP8tkTpBpCTkdT/uT6flji1sEDohFRj3LZNAzc58OKRy2kLa5kUIAoE
 BxPqUnYyZTjiLRDnS9oSam3j03LNuBl2f11NEP3wve/h8Fpp74u9viAWowKtZmwu/zcIikLKErG
 mQbvFEZ2wfbyRurcQsb4UnsJGV46rKyRxlKXxxTm7l1jrvePAPtCXQ5kBAGCGKp+xRrRubIrv4k
 vi2UzOBgXMxUMtMvTKq5jkmgO/F+7lDRnSrgx+AFbfOhgPVnfLlG35n2X9nGCtbm+hL3tDHxEFx
 vi13j8kMvLSZOdMS6K/gKbjDWIXJ8rjoHcGvTkFPCHzpWD9iL38KBSYizGFhAf1ajY+XOU46bB+
 mUuVJAxqUoaXpi25KBg==
X-Proofpoint-GUID: tGp48DjOPARCnjEsbgeoS-vNW9ZFYmHI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2NiBTYWx0ZWRfX4UJuMb9Ob/k1
 M1xBQwcEFxR7BHnFzBBZds9sVYwxrLfBkPAtGt+mbBB5MsUyPtt6ZrvRxnzVTC5dhi4vmS2WWCG
 jcmufvkGJ5b01hEGOgkZheTBR59CD00=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9ed175 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=QfF3HK7Zz1vlX18Rt9SXIw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=oUK8ZbFcmN_kIjC8GbcA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070166



On 9/7/2026 7:43 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 07, 2026 at 10:03:17AM +0800, Xiuzhuo Shang wrote:
>>
>>
>> On 9/3/2026 7:55 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 03, 2026 at 06:37:03PM +0800, Xiuzhuo Shang wrote:
>>>> Hi linux-firmware maintainers,
>>>>  
>>>> Here's a pull request for btfw. Please let me know if you have any problems.
>>>>
>>>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
>>>>
>>>>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/xiuzhuo-shang/qca_btfw.git main
>>>
>>> Repo not found
>>>
>> Sorry, the repo https://github.com/xiuzhuo-shang/qca_btfw.git was private, it is public now. Please help review again.>>
> 
> ERROR: Commit message check failed
>   commit: 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c
>   author: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform
> After correcting the issues below, force-push to the same branch.
> This will re-trigger the CI.
> ---
> 1. Missing "Signed-off-by: author information"
> 
Commit message updated.>>>> for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:
>>>>
>>>>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)
> 

