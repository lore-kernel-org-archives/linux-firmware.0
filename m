Return-Path: <SRS0=6C7S=HI=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8663BC88E5C
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Sep 2026 11:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 474681F000FF; Wed, 16 Sep 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789556567;
	b=h7g6sc3r0nA4GFIG++1CBmXTc++Ge/CWZy40SsaUP+fSXuwwRjxLVsJQ5DI0wgZTc5Wr
	 ElnUa81huTOGDlag5x5+8DNeYv9vUkR5xoej0BLXexrmvI6ouSCXrUSMCI+JwxGeLLeIF
	 muYmy2nh22NNK0e2QdzckXuENmeMmcV8cjzL8Ix/uarlsZJ8R4lYoeWwm1c3jX/Un+f2X
	 KQ5zGKzq+FF4/4BTUKCrSmdHfA+jFtSTC3++2lQ57PZ8zHwW2OoFUY5s4SdMgvDWgCb63
	 dQeeboDRNZE7zy2ht/3cyQfk8pVIJ0pfQircmpTXqWIONiNxzkLDyqvDlHD57rNkefQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789556567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QyWvDRjNy3VolKqpCEf3kf8Ru7VH8oG8at9XD4NYUVY=;
	b=Ogd5uAKXT/f13LH+zXTJEWTsjI4zJ8v2DSgLw+SrMMHUairPU1uEm7QfkMSikAATJjA5
	 1LZpAo9qLnNHzo2o4AquQjg8w9MzmOva1GuShUgwbWbrV0h8Zuifem1p9JYqALWQHcWt8
	 blRc9WOVQlNS4WcicveRgONgRp+0ionWANX7W0ubrVoq2KrPU3jtUoWbsLmAQiiZz0Pu1
	 Cn8HdjFg96r7cJyzKCtNw/WLZZqve9z8H6ZwHlTen7kEEmCKNvAbBCfTgHtIIjSuaE5cq
	 tVPaUSN7+kOylAoFOZsNDEBFZd+txGLUgiUp+6fXVp+Q50Y8t3wKq74FZ7+fTHMsHHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RXatClUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=koEFqWTo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D1331F00898
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RXatClUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=koEFqWTo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7D1331F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934op2226507
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 11:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QyWvDRjNy3VolKqpCEf3kf8R
	u7VH8oG8at9XD4NYUVY=; b=RXatClUs3aQimqoNv/qKFBk/EwuJgIaW8yXDAtun
	iG8C/McwEc7/Js6rwUHWz8IEFatK0PN5626RRfHs6aMBLjQk6zHlil9So6rZutG8
	5fI7zuvUKaYCr177eOqYkH7AkaiI/nOH+83BT6mnMBIRu/4Muhw6gq0nu+ZjMwq8
	X635ICqwDyKXfxakNxLv3VR/jyfkVCdJQwOM8MQBiRnXF8Pc74qe4y+WPN5iMcDg
	z0VhzRfi7odD/iZ4TsKMQY1fZzeMmaXieKq0KpAhbk+zWCvf3C0PNBQ7TeVWVkLe
	D8taI9anSlpjWw1JEggpxBH/RTVXUPLcTJDUpAqNP7iSDg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9uwxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 11:02:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c683ca769dso2008048e0c.2
        for <linux-firmware@kernel.org>; Wed, 16 Sep 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789556565; x=1790161365; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QyWvDRjNy3VolKqpCEf3kf8Ru7VH8oG8at9XD4NYUVY=;
        b=koEFqWToBt653gwmnuhj973ZekBN6XXk6KNiNfX5R1S3DD5T3PeWdSkUpt0pTZV4Hg
         cuDmO6rGE+lsmCuVGW8wCRfcaYoFHeAQovcTYZMmfEDfulcxGZxYNqgfj3+Mp9n99R8t
         DtRyS7U67xM8wpjvAPzuhEfoM5RobVjmow0nEQhxmXaIlFLw7v0wjD0i9YlMtIYNsmpC
         wER8mij7okMtRNFefN40f/KbwcreO+TnDnDfH/RoC0EjbCauHg2mRz26vrI+SBkbGRvN
         eXCixR9nuQBztPSP/GY6zAlenrlCuvbxZc11b8pa2ZWj8vpIW2h0hbmC1e9XQNjsEpwt
         HYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789556565; x=1790161365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyWvDRjNy3VolKqpCEf3kf8Ru7VH8oG8at9XD4NYUVY=;
        b=rfD9/TpMIhSxAHkDHNV/Xm2pWRq9s3xosSCqJXXoi/2y4CHatdumuyRtAx49zkYcOI
         KZwUu0unJnx6Hj0kjW1NvlJjEVUzRp3WOzvb0IOKUq7b6QIbFCbzhZtz53Sc7ce8KcLd
         SoZsBGIKlTMKjJI/W87cK6fJBGxqf9yNCjuV0UZAQB8es2EDzzRZsPEhvl92Z0KHCDgy
         jYBO7PHLy9PgsNAOjYNxeErxg/utsXjK4iz1P8yQV6+tcKBpZlSNP/od46zjDv7H868C
         5xpa7hKZqx2FKBLaUvG9G8tF2gpZ/SugksYdlXpd8ptC6tSTH/a3uQJCwxiWUm08KjoN
         vxRg==
X-Gm-Message-State: AFuF++nKQ/ckOGkXuAvnD+UrPn2iFTAQicRVSbaDXzVxMNjqkezijH81
	IzMDDe4gUo0fO20uCeYamsjU6XZ6jbNjc9zFO8JN1OPSB3StRJnAiLHrJUIwXt+Uu6dr4y3/F9/
	E8fVppZp151MvwjKGEGt3g7KlVwlMGxrSwb1aruYd5QLmGxj4Ds4kkbN/UQY22ext4uxP3vY=
X-Gm-Gg: AYBFou2qE/aouHLadI+mOkD//mDHbWxCZNFTM8vfzSL61AY4vXxri0OURKam3bFEyZ/
	MbTMM7JzKi1mbbYAbvl2fd8x5Uhd1m9oXe2VMJQ7UKQ6/7T1neQuziGbxlTZn0TFH+Av0mevpcZ
	GNAz7A+lXmDfW+NCV4klb0bPJbKEVkw9sk3cvs9naNNK9vDwo65r4mLLBqLleSDptJ1udA42Rlx
	+754qzpo5kMAlNfwxDFVi3A6Z9otXs7YvbgGB4jW4Rz2HPu4L200pAauJrfmly/3wUJV/mr0Hva
	f+FvS/BydX44z8mj05tOofjIjDBpL96+bVm3y3f+L7DucQ6KVI2U47JGOyx6YxXGKZI2XWOl0zR
	utxhvaO+yYwdj5NzjZbDBVadFVNYBqYW1K4Iwu6mThClvsXvbTwTyQIWP7fXk8bTI1J6SeZ0zN6
	Gx9kzbB7LPm+Vc
X-Received: by 2002:a05:6122:1b0f:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c99ac2ec94mr1651703e0c.6.1789556564561;
        Wed, 16 Sep 2026 04:02:44 -0700 (PDT)
X-Received: by 2002:a05:6122:1b0f:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c99ac2ec94mr1651641e0c.6.1789556564090;
        Wed, 16 Sep 2026 04:02:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3c34sm744209e87.17.2026.09.16.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:02:42 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:02:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for maili platform
Message-ID: <li6lbt5wdlfuhbe5xxlvpeoc2fpyiljia7w6col7y7b3heb3bl@tom5ijk5rlfu>
References: <3f6452f1-b7f5-4631-881b-b524d2848cd8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f6452f1-b7f5-4631-881b-b524d2848cd8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa7755 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=Fq3KK7dunV0SBdRsiTUA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: K5nhapajEdGa6UZHis5RoocBO0Q3F4K-
X-Proofpoint-GUID: K5nhapajEdGa6UZHis5RoocBO0Q3F4K-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0NSBTYWx0ZWRfXyUNbDZ+Wyx5a
 ztpvUoZslvWWK7N/OVZJPIlThuYy1hbDAjDBIidcsZCn7xB1AFuPOO2g01FOu7yfhGn2IMvd5NY
 7zX8DzIywJVLw/wFLhQXwh4Bt4tYtCXJA4yBAOSAy9z+mf9GNFnToA7sW8nq/lnzY4y5p7vnNeI
 i4Amg0ODF0UTkq7pUq6C2nQjxaz1WzhBSzGEnA/vUPai2U0TPiDOi80UcwQ+2Vzpyp1zYBTFKjF
 8ChhvQ/wvr6OuWJC8y2zp1VZ+uB9J/U6i90FdpQHKfG/eB4TMuaGH0AA97U7wkcQfcXLzqN+TkN
 5UNd7LB2Fr8TKu7e1lBJzDEgQwuxLxqLJgx8gyIi+NAxRw3zQ5bPuyr8So8xA0lMaFDR9ghb0UP
 pz9moQiR5fX4YUd+OCZKbExTPUQHM4gWx98ZyxsmTgy0YUJV20Zj1wH27H2yEFrVLdpkZJx90eg
 WiMWUzS+ShTfQSUF1Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0NSBTYWx0ZWRfX3iks1DiKHtvY
 CkHd/mTsFN1FMubi97ieDCUywv3AtnGTH1uKZ1Pf1Y/pFlLsr/u0SwI8bdUSJ2pfVD1AFfXcEIP
 Ff4ufVUYITZmTxrJT3NQXWx3mEP5TEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160145

On Wed, Sep 16, 2026 at 12:17:07PM +0530, Venkata Kota wrote:
> The following changes since commit 4584045b21217268f94a4a2a203d05545345d313:
> 
>   Merge branch 'robot/patch-0-1789459360' into 'main' (2026-09-15 13:04:08
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-qlifw-maili
> 
> for you to fetch changes up to f060314cfaa136d27b0a5ae35193ac9d2fe7ee24:
> 
>   qcom: add ADSP firmware for maili platform (2026-09-16 12:14:13 +0530)
> 

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1254

-- 
With best wishes
Dmitry
