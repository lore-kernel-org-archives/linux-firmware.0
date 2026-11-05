Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591E606A31B
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Nov 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Go8Uzj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dh1/Ngk3
Received: by smtp.kernel.org (Postfix)
	id 2863E1F00A17; Thu,  5 Nov 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793878420;
	b=1gleV+hxmgC9CQPjgO+mzjnH+I6w/A5EuS3MWVk45ELxcPZxwKgxniYeyvXvMh+mvsrP
	 +55evMSwZHkJseKoLkfgiKhnqimI9bf0VgIdPwDcvHU+AtcLVd3IDWhI9S0jNr5h80B4O
	 fW4xwbzh4AZmLmuM4qcUEocqFHMrQEmV93uFq6MDimEF5B2UgrkSJh2/bafsvcYnfZSQ+
	 DLmRMpbgmCmOGDfrP4iDIm0hix2XTYVSJwnDdPOUaJunEoYMRd2Cqt4MejJmgwNryGpHg
	 y2VWW4rn3TblthjB16cW2x9qSRaBFxOIQ47SpeLVEIz5KPNjXHq1wtmqpxNhf2LmTDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pDRo4l5AU5INXxJEP3aeIGNmrM+6zizpy2Yzww78Q4U=;
	b=YJ3Uu0LeBJwuxFtEiSuvbgxj4OG8GcRElhf/6qWtPhJSmpTICvHtv968Vjn5DpzN4j1w
	 6IuqiNPsSIHGQyNvtsU1lkb6d3U27bvCu8vik+cd1GQzqQ09f0MY8BPj0A3ISU/1t7wdJ
	 MzpfUSctpRwenbGs+UtVXIGihtljJTCtht++RyGUH1Z60O2x0ksvt6XTXtS3YmCZ5PBV4
	 FVCmA1cpscitR3exr4vp+oGNtKnUTepk2VTypqxBML1DgmlACRNAZ+j9T9ZyMZVHOYdS5
	 7q0Wld1OUMee8neXUQpER3kHzHBNgFSYt3Npi8pEFlkJTanXPXUNsB+TQCTwG31Gx+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Go8Uzj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dh1/Ngk3";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E4DB1F00A02
	for <linux-firmware@kernel.org>; Thu,  5 Nov 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0Go8Uzj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dh1/Ngk3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6E4DB1F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59teRN1028357
	for <linux-firmware@kernel.org>; Thu, 5 Nov 2026 11:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pDRo4l5AU5INXxJEP3aeIGNm
	rM+6zizpy2Yzww78Q4U=; b=G0Go8UzjdR1voKoIpQTTMEuVCM1vK1Nphd5eRT0O
	Z2DKVKXT7S+X7OEn/Zk2vtKmkQ+pxHpJnGR76PfGOXnYSP0Y8KimBxdkskQ+iWkw
	eR3Qj1JKYVyr4ut1B8k/ERpZQ1P5qXf9xKRcUeN+qyoaEqRk8778Ge4w+P9XlAgH
	jv94Xi09tvP/THesOl49d36fxJ5rsjQIaA1uVcIXaB7rV8+iEDB41B1KiP4/nrJj
	uhFg7e9BcHoU92odesJan505+MtKEXJUxSaUNT1rJBcQSkXb6f2G9yDuHRwTRiHU
	UYWOMDPHhEgEbTUpBEakR1iZLnYm4oQXbooPgW6P4K73RA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9gu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 11:33:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535066512b0so49539401cf.0
        for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 03:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793878418; x=1794483218; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDRo4l5AU5INXxJEP3aeIGNmrM+6zizpy2Yzww78Q4U=;
        b=dh1/Ngk3qNelNBD4q1EpxL07V0YsV/UCzSfAByhueHmr/fOMsHlRVQiqkK3DOEchjV
         symHtx83opxRhwMCiZ8L6URU2ynBNzyamwPm2xaUyHhzrL2vhgVyH0bnRgcXZz14hWQm
         oStXnbe9b3k5towd2zqaV9pxHJ61lObq8X5sA4xasJjn8s6YyBZmrnD0uoa+mgl/prh7
         i9Jr4hMvkPDklzC8W7dgAkhwXKCm5GpQS+1Ujtds/rM+PRneJvpHHe+JYOmlOqQc/DE0
         uM8wCq/rbOpP8DnfXEQKHrifFHzXfYTKkEsZt6EFYYDCY0z/FzIOIRVkaDjpSh2SUYpy
         WQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878418; x=1794483218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDRo4l5AU5INXxJEP3aeIGNmrM+6zizpy2Yzww78Q4U=;
        b=1r+0P+XMDWSmgGZDhCIRBmw4pTCyvHTPRNbHBPT3r52BPggjeoJbTM75ckSq/mXoth
         nkRl2g1UdAhV/u3wU+osU8lEcUBUIU8IVSE+Ld9OsJTrqZcLglWFkrdKK6tSVZjDgwd4
         4ae281v5MN5e16VULhQNnLBVCpXWtOCeB0SkOFXTEYlc237bXqQq/v0s3ssj1/g2oJmg
         SiBuI1q2Si2EGB5MyG3hxy3xLM7r7b8OfBfN6VHd6IYwaYptOewwy6TPVQNAFOR23J2U
         lyqCGKHG7463mu90TLAkANsuanKFRdINMKSw63R6YITqqmddGmU1Zw2zf0oKr3NOI/rr
         aiag==
X-Gm-Message-State: APuU4Z/fahIZte+2WsvZNA/w3qqgUUDettJcs6mLLtmxhgqqVTtsGuf0
	xAUQWiQPtXA4MBoZsFnFEjsdAL2ULdeaItcKQS0nlZ88oj8qEtqwntD1MDoKHYjHzbm6XAGmNca
	b6vcoID7oNEhw9CHHRQ263E6fwuXe00ud+o9BeMvgwKeLhVgDy6JFyHNkDWzpq60=
X-Gm-Gg: AYBFou0JcIXEW1+1NhGRO62CosUoiYOBIwi+q9uTyZ2fzq0dkIVscfaWZNnGYN2wUyZ
	QmxRHvgUIC3sWi8OszI7F301JgAG0ZgR4jHv8EZEKWhhNguRtFu5aMbvUqzj9Y0iM+DkXwBVeUC
	3a8mAwz4EMOtySYWpPtUca5FwMzYAGpVtEsUEQ+u8WeScZScmaoRni4K3kdBtUsIJO7N6y+lDRG
	T7rhTE672cNkHn5N+rrCNwShGZyF2X/i2MvSMwV+IZu6GDurM9DSfzxMO9Iiv0iM/2IbJ2TPOqw
	VSitDUWWDruFZLmuplBK6dgV3UQ25B1ifHigExiwwirR0sORUtwymnO4fy74NXLi01QxDQkhrEn
	ECam3Hi5iUpCREMZPBi5FTglRn5bj5Q0MtGPIGFJ1Vo+AS1y3wxLzq3U8f5Gm6DNFTD2kxzNQih
	XpW3E+G9KmhsaL7SiEcea/6T+BZ1Cn8tGSccKKq9zK0Ngd0VEIJrnDuOrg9U2M
X-Received: by 2002:ad4:4ea4:0:b0:91e:a219:fed9 with SMTP id 6a1803df08f44-91ea21a01e5mr2600266d6.1.1793878417428;
        Thu, 05 Nov 2026 03:33:37 -0800 (PST)
X-Received: by 2002:ad4:4ea4:0:b0:91e:a219:fed9 with SMTP id 6a1803df08f44-91ea21a01e5mr2599806d6.1.1793878416774;
        Thu, 05 Nov 2026 03:33:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6cd611sm10422671fa.19.2026.11.05.03.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:33:35 -0800 (PST)
Date: Thu, 5 Nov 2026 13:33:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] Bluetooth firmware for Qualcomm QCC2072
Message-ID: <6rptq66wpput353d5rn4cmvbjmwvz6aljc5a2r4zi2tj3ghahx@xxoibgwyc7yu>
References: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c5ed05-8ba0-4747-8c0e-d8c69cd6b012@oss.qualcomm.com>
X-Proofpoint-GUID: BCcVyM4ScRmUr-hMcqOqV6ZdUwQB-xZB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXwq2s20WFCWN/
 Dsy4qvJ1MrYzhTYvLLvNlNC9lCL6p0QwF8Bzoyqi15glRMQadcJBHH4CFZQvBz1pXsVoRpaN0q0
 cCWFenZRqd0VgeqXI3LbF76hqvc6lLA=
X-Proofpoint-ORIG-GUID: BCcVyM4ScRmUr-hMcqOqV6ZdUwQB-xZB
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec6992 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6tDc20NHRe3dPXSO-9AA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXyUTgisAwVZ8L
 SyRTAfacyiml7UjZ0iqm+ExjmFIYyz/Qo0Hw9aEYNvcKwUK4Q3vsWY4PLTA3x6n0HdTSHBN/Ind
 1xqp6hGDQ/V6BFFUeG8RiMevUzT0EMxVKta17DV50IFRaBK0deyRxyQI9N5BXQQSMsaAvcfK5du
 CnHVJdQuWeTxkBtmuyzuuvRBBDYzXWDWXk3S5cuiWzYlL9hIDAVjY5frZn6ilTkTVJp1a14P4+s
 g/LVVB/IkwhJITb1I0oinv5N2dpMbfcWvNZsepGGOgQqlLFCKkiBlxRxuXF+cBsBjzV17yOPcQ9
 LYzCPB2jS6vJff+dXPnZku4Z2QlF/vrDjI1JEoDTR6K+fDbVqX5pE23P1BAFQtfR5LoGd7+quqZ
 lrlh7lNmAbqnBZ5tSTY/fO7SPQMqDiKn/Yf09F1hGWYvWbZaSa6/gEiD9++Yo3BpIiSQBRbrDEf
 nY0QmvUEtufKqmD7PZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050045
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:39:58PM +0800, Zijun Hu wrote:
> Hi linux-firmware maintainers,
> 
> Please pull the following linux-firmware update for Qualcomm
> multi-subsystem QCC2072 btusb support.
> 
> The following changes since commit 0cb5a7fb037ef9489deaa4ebecd78b40fe7c07c6:
> 
>   Merge branch 'Dell_ISH_FW_582.7822.0' into 'main' (2026-11-04 01:33:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/zijuhu/qca_btfw.git btusb_qcc2072
> 
> for you to fetch changes up to 79b0c4d9010f97e79322830461843bbb2740613e:
> 
>   Bluetooth: btusb: Add firmware for Qualcomm multi-subsystem QCC2072 (2026-11-04 13:51:32 +0100)

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1358

Please abstain from adding multiple copies of the same file. There is
little point in doing that, use Link: tags. I've submitted a pull
request removing extra copies:

https://lore.kernel.org/r/20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com

Please take a look and comment if you have any concerns.

-- 
With best wishes
Dmitry
