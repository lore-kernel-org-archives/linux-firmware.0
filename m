Return-Path: <SRS0=bkY5=GY=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0697C61DD3
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 12:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 848561F00A3D; Mon, 31 Aug 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788178754;
	b=VD0CvuKZp+Wg+grBTuhA4iNeofgKZNEzKFo/VQ+Y7AXt2nFl4rVWu21n4ahX6jhPM0fK
	 T3+3q5dVqoazE1fsdgLcJaaEMfTOevGW/ILxZ0K9FpRibFxteTNgLKTVZXDEFD89XDFo+
	 AdQU4EzMDhy3FaPANlrLAo5A2x7e33xPaXAtNztTOdDqliMEGvE9NeR+cXIzyiWBajm/w
	 pj856iW02jKqGuW902qPEsaclo1BxbL7Jn9X4PVBTz+sSRh63PKcfonV0lUg4CdMSZH2X
	 XpJWXNGvN+LermVOGo1tit/d46kk3ym73kSR0MmiJ1MoG27lo7LEE2LaBOIxi/5yF4g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788178754;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kh5pIR/mzIYwij5pgsahiZ3GCHij2wVrfG5ssszqXVA=;
	b=HMSWPSEKknlDzM5/57PKYRcqmffHPRHYDOqTosHRTKPWIcoechk9BTc0VK6sLvUK5US/
	 73xwWoYR5p7Dyggw4+7pJ3kH4nAeFTt3NoCxrr6yHWbxZrqaghaJ3v0W0r9ZEg6kPYSyK
	 wveAcRXFgLLM8T7y1SVWJMWLA1o9U39djhgR0+oyuMkXSmzFVUlCwUVRa420RVD/NPp5P
	 Tda4TbeBV49MG6mSccluMSbl7yrfJEHwH3pKTeTf4ogdQhEk0ZK+KiSijTzLvOnxV0Y3Y
	 RxGJfdYkiGuezwT+kFWVUxa+wVJVg1fQoR83wGqLGJq2VbDdG8FPuZw/DEHlGI2ZvvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onpn5vkP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5kZLqiy;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFB651F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:19:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=onpn5vkP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T5kZLqiy
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CFB651F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBA7LZ3517872
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kh5pIR/mzIYwij5pgsahiZ3GCHij2wVrfG5ssszqXVA=; b=onpn5vkPMYK7ZaEn
	C/2rwjm7ix+ej/c+B63pob3ISvGP3Md28oyt00ZvuKvt967G9CcqUNPMqvvmZKgD
	93q8HVrs+t96b3CCTVJ/y4YbJRZTJXJ6DtpWPeX7ctUWwvuWbzRJCHbcgrjUmko4
	RKqeRz7Dd2lVM0QokrqPyVPs0reg0mkzzkHPKIMI1I97s7OwWtXeMnFSG00TJAN1
	nq27ccN46f7v0oEH/z9YuSiw9lc8Ne/bhqwApQ1ZvAhastntdsIdXUJiBT4JIYOd
	sr45J/nfxeWDAhwmK7j98Heu7jnVvaYEVr1opvSYyqxmGbLGvmnd4j29h5lj33uz
	hsco5Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h90r5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 12:19:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73883529f72so2845013137.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788178752; x=1788783552; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kh5pIR/mzIYwij5pgsahiZ3GCHij2wVrfG5ssszqXVA=;
        b=T5kZLqiyLav2OTI3cRQlmAJu3EZZ4uOnPhJd37cd+L/wAQImt3lrwcqSa9yvxbYo8J
         dk31PcQR6HrgsmC07CNXqXgQ69BJ9VmhupS9qgg6xsxsvH51hh3KSjxhcMFx83OyhdEO
         hAgL6LD4PYilyvr0Rw4Xur3Aa2sYI0o8Pwj+oMH1AK5wTZOCePvwlHamfZem97UQQbSR
         vjGSQi/y61Od9xhLD4ZN4nssXgPm8iwEwp4LH0W/JwP4+jjTD6Riys892Dw9jVU/G2FI
         qreyL+BcQ3rDC7ZOZslv51A4SN0wYsBN4bFXWNS4PeWRXdCMXtaT2355Vx/loRes6fHG
         cYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788178752; x=1788783552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kh5pIR/mzIYwij5pgsahiZ3GCHij2wVrfG5ssszqXVA=;
        b=m3Bv37UJPDazKfRzWZ/NXTse/3WxR4xA7Rm6VpxHtSA9+vKbAicVIIJhQlWY1xI2ZB
         UguDAYZZVn6MjA/Rrj+GaJVkkXSrgGEMjRECey0SyfMBvCUwCKKlw3ObIyGCoP867iae
         +sO3OPxMR3m5+r2uQME9UZWM6mwYc7TQeTyQfGSgReUrmS/DPVKk9RLhPgVwTpz8trx3
         T9oUbYF6H8r+En6LiU++sNF7/KHf7UcoH75maO5JSJ6gzk9McVHtptX+jPIezhjaDHcK
         OEzn0GSwlf1iLZmt3iVue3O8BD59sHtyRKIGAwNPoLvcxz+1FU04t+tWvoQslg9ECOp2
         X/Dw==
X-Gm-Message-State: AFuF++lIos54+YjZCUln+l1pEmV0pbVDDOaoyCkChit2RQJGKeYN9dcI
	+kgw4cNHh51HTbZr+3jUirUqSfkKC9/dS9xl0IRao5DJPIqOFcFEEsM9CGqFer4t2dLzn/+udFU
	4CF8nBGuRI9mb8GdPAz9ugm5AHj5g/bSqbNiPVYGPTQgYEV0824hHPJB0//trRSUAftX+Tig=
X-Gm-Gg: AR+sD12yLoRnVNmJ00R4HGR+exzn3gcj05TRgT+mi8bDUFSb6U3VnZ+iduDFtfOhu5d
	eyv1TbdFrK7q8ORWTeNyXuszp7cGQSerY+PzFDQuvWXlWvZd4LtoksKip+aOYS6642OFsMHo4Nj
	hLhQjp767zxXExbqA24WXhspxWTUc35nNyAKqVHEuXbShsi25pxDVfzD5kUDU6TxVa+pdP6FBT9
	NgDmtNLMjEMcR0f18D/nMDQ9jA9fY7l80Bs3q6sIfChY9sUHgfYGIZ2UlDQ8zFcsWL0H96zkxKc
	uOOccWeNCwRxrDp1VRKLemUmx+vFuEj+zfrCJr49R3ae91fSSpywjM88FLF9begDl8RW/wEKzt3
	yKAW2ydMKKTZB9Ehclv31XgalHPYvtLGFuy7X9XiUrTVQuIILbCMQERl2u6Me3vMqeOtLM8qpdN
	kYlEWGZQ7r9wRI
X-Received: by 2002:a05:6102:a189:10b0:785:e444:15e4 with SMTP id ada2fe7eead31-785e4442a94mr4659024137.6.1788178752076;
        Mon, 31 Aug 2026 05:19:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a189:10b0:785:e444:15e4 with SMTP id ada2fe7eead31-785e4442a94mr4659000137.6.1788178751528;
        Mon, 31 Aug 2026 05:19:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3051f4c00sm20378511fa.0.2026.08.31.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:19:10 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:19:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00079
Message-ID: <47vshhcdticn4jvykga5wrsef62aj6rnnfrc6f3maat63kq5zj@c4ed34y2nuvk>
References: <204137ae-e9e1-4ce6-9d2b-006fed541bad@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <204137ae-e9e1-4ce6-9d2b-006fed541bad@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a957140 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=Vc_to04IFQ7XAoiNsIsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: jVHQL5T7_zTeVhFEaKQHDXgYFzl-Bqq2
X-Proofpoint-GUID: jVHQL5T7_zTeVhFEaKQHDXgYFzl-Bqq2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwNiBTYWx0ZWRfX+qVBym6AyD3H
 MQLAFA6kkNlYC95Sdu72z/n8lijIOhTUNE4KRgU6y6aWmkewO2bRmsKy3F117gediF/QN6nAesc
 SDGOn1qkezNRcFopHqwox5QlAe3aMZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwNiBTYWx0ZWRfX2PEi4UFk75Jx
 x/5d1VMW8XqbXTm4f9ThHLBjZrsGPnL2RkLG/98BR1inI3dGe2sAiUXdzDgeYokj1Z9q7xkMmcK
 U4eSN5aM3Zs9lUtDGTU0Y/ODMG0eN7nfApZb5U7Q8MfN7cspjXqLuMq6hpdW9b69aWEL18WG9dA
 OkAAZIycFOYB8zJrc+OEOkr2mGBjsxRPGhqwZFZPOfII/LGQfanpQiTaaeENd9gcUzeuMaCDu/q
 iPuwtDRfnQiyS7H09WS85H2tT9L7mCP5mHWyTcBQ0U4/SJtiJzqih3CA7eNb/YR3Gn0oAKS+hic
 22gZb8ciwZ4BGb2XONQ1csdlQd+YuX0Bl1w8idiEd8WuVoA5yZhy+bY+dNmj7jZ+COGYDRVqJKq
 bs13om22ewiU3pcDJGqGuNL3IfqsSKg1Ll5+VKRzMwr2tuHLDuFGDqIhunzSm20DC5rw3nJvyqA
 sTsELAXP06FZ1apCHXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310106

On Mon, Aug 31, 2026 at 04:46:33PM +0800, Shuai Zhang wrote:
> Hi linux-firmware maintainers,
> 
> 
> Here's a pull request for btfw. Please let me know if you have any problems.
> 
> The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:
> 
>   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/shuaz-shuai/qca_btfw.git qca6698-2.1.2-00079
> 
> for you to fetch changes up to 91a27f7816eae53b20a72892e7cd2e8925d34215:
> 
>   QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00079 (2026-08-31 16:22:44
> +0800)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1209


-- 
With best wishes
Dmitry
