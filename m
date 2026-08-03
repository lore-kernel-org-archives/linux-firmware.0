Return-Path: <SRS0=5160=F4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043C8C55182
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Aug 2026 19:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D38A31F00A3A; Mon,  3 Aug 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785784199;
	b=1ywG3bqFbEkvOhY0+A7OSNNAydpcK5k9OUhPVKqhJgou0D2wyhqIrw2xP+A69P/qg59r
	 tviwOAwjAcCo/RRSkKrk556nDI/NdmRrbvKJ3BJuT/qmnyJMW+VWPY9s3opnN5HuPl1Ix
	 kpyNvINDM5c3A8DoJiVPpjrFjd8bzUPjE9xIACgBGsb2CJ/LrLsrsHxshdNQdLHvMIsv2
	 +KjLkmrakiF0lsQPBQ9SvFpzRUvpAlk8TaROJeQRTaNpaZ2+klb5wOS2u9VKliVFjAaPA
	 5DEC8GE8rYFeIO8cTJtEx+JGWb424eBcpj3hrStnEo4or1j4nHZv6EI7Eul8c4SiDOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785784199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EJaotQue3zZSCz2sMY9io1yHvbDdBkt/2tYCT7ERQ88=;
	b=iXW/b8xpCORcl/fJkUWXpqn4GIZAr9u2hp87sAgkmGtGEXt16gLFYWEU8Pe0efM296uS
	 gfpHPUI3calNYKGkH/eBBzoo3wqmppjdzmLwycNGYwC3b0B/IQk6Dl3cGGwo2Le3KAxoY
	 DmlJvQ9hOOqKiELUScVIkYRfDBcqhyX2AFB78jUOFNHwyHtI2FnXSz20fiqeM0wUbtWIH
	 0iJM2ZlvQCA8FCBQSaGgiQivJ7/Q0RRzS6Oam0KVTiGvWMZdRH6K5duIZBKvvAGqr7XBv
	 66DKdyfaAdTjD6naEayHDimgw/JPud/uBJEeL63dRM+eGGvk8bOjFz/Cb/6gtimvhYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLx9dUhG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="cCDNR/uw";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BC0E1F000E9
	for <linux-firmware@kernel.org>; Mon,  3 Aug 2026 19:09:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLx9dUhG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cCDNR/uw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2BC0E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H7HuD1535999
	for <linux-firmware@kernel.org>; Mon, 3 Aug 2026 19:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EJaotQue3zZSCz2sMY9io1yH
	vbDdBkt/2tYCT7ERQ88=; b=YLx9dUhGEoQiKMSThBB8QdJagm+mOflc7XPv2Kgl
	psDxFMikEPXysGAZ9BPxWJz4aJ72s5CDwPHhcokkFThmLt6Y+4kFJET5tEQa2TC8
	VJ1VkSd2qdRC3VBIB39TwDu4yEmSvodPtybg8QHNrmClq8kao4R8MVCBoBiBycuV
	06FzSHMHGRnldwIdU88qgwoj92/6KvURir94MTCpEC+WEPQuDk2HuXEfGmVWY2GC
	FuBVmVd5nDXSA59ekYjnK9bdGj27mm63K7nTvHCH59jgRrnqxcGDddko2rvD4zzT
	dK95K/l67VaI6k7AfwSpXHPSbnaL52eRKngebPiSv6BVFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sghtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 19:09:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso35662381cf.2
        for <linux-firmware@kernel.org>; Mon, 03 Aug 2026 12:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784197; x=1786388997; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJaotQue3zZSCz2sMY9io1yHvbDdBkt/2tYCT7ERQ88=;
        b=cCDNR/uwsXdiDdk+Zh66/Ny85vAhopmxZQPFNkMGk49e9f4smM5yuRgYqD5CZpQLlA
         hn6mQ34i1BR7Iuu52pr0RS+TjzpttZBG+fsr6XetupW0B6oPzkrNK7eCHAqQPux0BVmw
         BV4RzHa8FqagocEEavXA4eAvRPiPcs4dR+dyFtIu1ryx+5fJW4qvLm4h1OCUdx+hxPr9
         jYX69QMkl3raiVg8qzZ2UnQUJP8tlb3wIiBz3MFOF6/e2H0y0Zedy+uwfpBfjtKKHHLs
         kE2jWYHHT+yS4wyWdDto9T63ZmYJQqSFS0358sFt0NQvbGwv9+c5UPvAQXS5OlBa6HNw
         3F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784197; x=1786388997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJaotQue3zZSCz2sMY9io1yHvbDdBkt/2tYCT7ERQ88=;
        b=Y9nelcZTNORUyI9bojYqatr39gZigUFOZXezHShtC234jbZ4FrCpHLoRwANoDUGyNv
         XJ7Xd90MaZYSBxU5VESrnYEQ2ZBFXHlyF4plHGVsWcYddt64Im4MT7roL5kOcac/Zbwm
         foVXNQ25ZLmrz3A5pBBrgLk8y/WCnaFpgLHDJITf+PIwf4PGKljl5KG1+NVHKkcbozC/
         Rh8ew6ZCmqcX2XHtGKbW5iJOApOnM0qXtc+rNvOFjrMRfBPtPuk9GQH6qle7FtD0MccQ
         HO1sPWD/1sdRCxE0Onp1BEjITJTctPMARsaBcoAtz0rUZr1PHBajKcmKnwaXesJZrl4z
         fRIw==
X-Forwarded-Encrypted: i=1; AHgh+RoOb+LBEu3Z8QHzSLZ+EIMa3QTczG2P2ty+sGhsgFHmnEdwkNYWD8ArA2SIw0ed1p3wT3ZfLvefHobHchHXdA==@kernel.org
X-Gm-Message-State: AOJu0YxH9Qi3rgR8DUP9hjy5wNkvYRJ+EPYEc7K0etXA5lwmyF1pcZ6W
	MCkJ6DKAZnlNGASEklw9e3OgNWdYkgCwGjS++NCodxD4M8Q1nsUCOD2EGYf7VVFgPZjWePWQ0yS
	sU9Us/CVOnA9wSkZtAk39hW76LTPD2Wl+LkV8B8CgYGVNC2ibn3azS/YNycvdcEE=
X-Gm-Gg: AR+sD11g2ehp6lF/RqaQh8f37IzPXVp8BMhBTzpnHqfQusYrzx8Gfj2mHv5/1B6vwya
	bh42Nm3Mi6Wa12OiT8ja3VxXk0ViRkL0pZjgbi1709oW5rMV3dFgzGC/brmARBmBXUrXn/WlHr3
	ZN+EdKcpRQMsPUPzv3dzWbU65yJp+MHMDWKYWEohTDjX8xm0xBegmqoRinnoM+jVobmd1uWeUwH
	oghon78ZIgZBbRbMxFw+pUF2Nttw4tyyy20fPGIpdinbZd5h9w3s4Ajb+5D2DcGQXmZVrB9dMOB
	spMvCcoMgfz6OfMzhJVtKdw+Oq0DE39vx8kzDCrFRVtM6bKnCYEoTDtpCRmI+CxM33442hOkY2P
	IPZtk+qrmPPre6T7mv/QBXfuG+9AIlSz8i27Do3xUXG6NsT7MHwlrupP4WQiyDisC+3MiAvu/hL
	FlODMvI82RFjzhxQ==
X-Received: by 2002:a05:622a:588c:b0:51c:164b:b240 with SMTP id d75a77b69052e-52b5676019fmr227457361cf.4.1785784196946;
        Mon, 03 Aug 2026 12:09:56 -0700 (PDT)
X-Received: by 2002:a05:622a:588c:b0:51c:164b:b240 with SMTP id d75a77b69052e-52b5676019fmr227456911cf.4.1785784196546;
        Mon, 03 Aug 2026 12:09:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c55c3sm2276099e87.4.2026.08.03.12.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:09:55 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Baojun Xu <baojun.xu@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, shenghao-ding@ti.com, linux-firmware@kernel.org,
        13916275206@139.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, robinchen@ti.com
Subject: Re: [PATCH v1] linux-firmware: Add firmware for new project
Message-ID: <54temeihhpr47mdmbiiyymfq6z3i4h6zyvfr6a24576rcdjh7w@kn34w2gx744o>
References: <20260801023143.1295-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801023143.1295-1-baojun.xu@ti.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfXwhFmBvxAinJr
 lpLVXwK5eIONs7Sr1ZfMV01soAG40QNsBPp206d2F275ZGWjCns98PgujI593hG8CSZ9aBqrvGr
 SNA9kT4UBquMI+fLe8nrMySDwMzc6qY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX01qBq5pMiswM
 FYqcnXRL+yVTMK5cUQO98wWcyvep7EInrJrid7Dbz6saajqG1rQuzlry055+cphiMn8vqlLUgrf
 M7wY02/ymH4NEia5DrbEemhZNWw7sATs/Ci+3UpU6eNhQQFaG5eJ7GhCMEdqHW/8HHPVZ7eRX7L
 cdOCxEvxA1TNt6Q8iSyVUxPo4/aJwjrUtFi4HP3YZyBxuWAuEPYFyvQ//er4WBvIIc5B7KBLMdl
 8NCiWozYVukVirqChdoBu5unT5gnzENYYKWFmMKl2aBBlzutiClwHlqfWBt1hL89A/WDv4Jvhsf
 2GT/a3tmZLPy23+tngdguJeex3fNZcWvLfIO+ci59/zwd28XPz2z9bwR72CczqBi+mDcmwKeNcO
 eQgaCQk0HeoBSzWZOPHwIIUsUUKj+GQK+MLPKWPy3vjqeFscE1qR99C4yqLs/hadU3LS2JBmhdg
 vqO5CyH5metuwvN0Hug==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a70e785 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=sozttTNsAAAA:8 a=5lSAVLIjjQ4NXhZDnAcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2bch6-nCvNOyrbk6jUtbQyH-NuIFqjHJ
X-Proofpoint-GUID: 2bch6-nCvNOyrbk6jUtbQyH-NuIFqjHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030169

On Sat, Aug 01, 2026 at 10:31:43AM +0800, Baojun Xu wrote:
> Add firmware binary files for new HP project (Messi).
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  WHENCE                           |   2 ++
>  ti/audio/tas2781/TAS2XXX8F7E.bin | Bin 0 -> 19364 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 ti/audio/tas2781/TAS2XXX8F7E.bin

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1160


-- 
With best wishes
Dmitry
