Return-Path: <SRS0=UWHt=6Y=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2416D6ACFE
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Dec 2025 12:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9563C116C6; Thu, 18 Dec 2025 12:54:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C0D0C4CEFB
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 12:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C0D0C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5UUP1335070
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 12:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eUX0Ets4zSp4wH+vw3UfTDVO
	mhwSyeUJuSx19Qw/yMM=; b=TFGGKz56ij4K00ghpSeHChmhvEhc8DBvfVwX43g0
	eppUl24FqBBgzmD5J/isPx549NBdjps1l+EqBd0G9QHhzaB8Nnhcr7u59ODp7LQi
	q9OF25kQWLHV+t+ELkA3WcWA7O74oB/tmqpOCU2bu9RwQluybpCZ77c/q2eJHV08
	QkiQjyhPo5jpaG+2PZEB5FFL9O32SneNb4Y4VCejDDQdl20JwtdS28cI4VKr5RaE
	liTLS4P9nSiXZlJfvdmtyvStMsgysOLS4u6cwzM8OOF6JjSp5olgo2MbFkF/81tK
	TQ7sQbW+WdrktQAPRU8tWuzvONk857gvtG05Rup6lhU3ng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec0a2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 12:54:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so10330001cf.0
        for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 04:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766062477; x=1766667277; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUX0Ets4zSp4wH+vw3UfTDVOmhwSyeUJuSx19Qw/yMM=;
        b=OY+evVtmAADL5oMVwNdFuvV4N8TzQuA4j2MGvtQ3tqfnd3AL87ZAXTQcFQXm8MCIYD
         QQXAKMxGJWpovLrW4c7DMK1WIVVsGQXvEE5rSsU/vuc+TVAsLulG0WGBmF/5Pe8oReJR
         6HKFfkKEfa7ORNUMxgOxqMAK/wjDTT4NzriB6VkUX21FS4Gj+t9LVWQsysApQGGh5TpR
         Q8EzI02t00EJGehEIiTj0w91V6dS0sB0dxWRX8mfjxbsNlrNPOcp0Vu3RosK3Vpo/eOQ
         qD1V4z9v0V1ISBvzWg5wOFDfar/s6rzbeUMDL64eoaMbik5xhjLtCwv8R/sQScrF0H5c
         rzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766062477; x=1766667277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUX0Ets4zSp4wH+vw3UfTDVOmhwSyeUJuSx19Qw/yMM=;
        b=Eo7URF6y1Tv00VbF5stJIQG5SROka2jEGyt5W6+K4gtEggJ0T+sutlUt0PzwUjh8Du
         gSWLxTofhuhlV3Ynoyjf58xf37t6kFOVIg4clh09PCy3+4VbwPikaLamBy8zWN498NSG
         wUEbLmJQJRGoPHEMU2gQO16GcEfLBgNGbhaNCxfF0Ii3SU8cr7keOcAmazgR/6tBcnVd
         2KcEVqxLyuQxiJNPoygd1OgO8SIc8sJ2yuFNsUHQMXws7BHiWnuCW1ItnK4KfifZheiO
         9F0xCxJSMVU/ZYUgsFk+rzCPxnzWHp/vrrtkNqV7p2vsCwHIwjB63085sO6YmREE5Td+
         +fIg==
X-Gm-Message-State: AOJu0Yz1C6X1njvXFxN+M7DluU3/gzAwnHMuG2dh6oxSxjZsLjavA82j
	8M14SB9UH9uezdiVv92FBd2Ua+qQ8bUyJOoTk6PlgefZ6wQxHnPB0k6lXKZcuiIggTn/o6hwYgK
	0PXyBGvuwKJiq9I/UXVd/Fc3UIcOXqbsLIl9t2RvSzuPz4KXswS0vv1rl+zMV6g0=
X-Gm-Gg: AY/fxX5t+4NYeweKDYdHMd6qcY68QSXugpb5FTHzfxltYccZdBLVkQQNC0NOjzHzHq0
	+liq0enJKryiH+GzboItQekUkIHuoNFQOc74R7VPLgSQJ4oByZwkT7NN+dMJVM/zVFh7mHVNKVF
	CUEowGLedDZiDqRGb8D9hg8jbHKOkqeXaYRke3DlUDzZmOdykPRi8s6vVpX4CZvmvEs0pmW/i1F
	61vp2dH/DQKZxIbVZEPFflb8o+JL3qPE2kvIIojVI5CG94tehpA8WahkAc/fAAdYQH7Masda/HS
	jTqNe9ujUXCCk+fXPp301vNKHPKm/Dgrc/D0+OjdCXQ+A9TaeCwGRmZeA+J/W+hAqCLiCrpIY/E
	u1X6CYoy7AfzddgJoENkhdYyYWLHptlc/67cH680As2uJLFlA72cCzqIy2FyJXKN7bzjzTefvTh
	9h7wW2+sDL8/Eatr4PXEv5ewA=
X-Received: by 2002:a05:622a:228f:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4f1d0049d98mr280275651cf.0.1766062477131;
        Thu, 18 Dec 2025 04:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGijdK7Fm9y6o0wtD19OB3QS+n0r4NQNlaneuGYZqxlCP7ABb4OcI42myRAJ/hJkhKTfMAUeg==
X-Received: by 2002:a05:622a:228f:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4f1d0049d98mr280275341cf.0.1766062476733;
        Thu, 18 Dec 2025 04:54:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d8213sm1074366e87.43.2025.12.18.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:54:36 -0800 (PST)
Date: Thu, 18 Dec 2025 14:54:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcm6490 platform
Message-ID: <qavweaoiwe5cloycae47tkcdpct7zxzp3jh6hj72qm4cymehte@furnuekntipk>
References: <1f12b7c6-daa2-42c8-a5c7-690bc40ca984@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f12b7c6-daa2-42c8-a5c7-690bc40ca984@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: msSBgGuBRL1Sw3U7cN2EhBD8fEjuV_09
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=6943f98e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=aUqoF_7co1021J3qy_EA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEwNiBTYWx0ZWRfX1l7MdxzYaFJo
 nE4XehMUGV9tlQvz+XiCtfmSCdaFdZ4GxbAl1tVwr9ezDyLoRWGdmfFpOWJj+XXbOTm2y4f/a0Q
 uIWfnLKlWs+mNJuRc8TzwgcRdvLj2qJQkYGH1fyLWdIj/cSy/4PYHP99GMmfhXooz4uvUGQPoJy
 F9OgoX96+AVqQY4mMJrWRZEebfVcmigKkeH8QwBkgQHLYeViupRqS71C5LNSnbprx5AmfX3Alej
 LBO+diNsGIOXykl/daxkK8tgQo0ar3u8o48jCusf1IzrnRcly8NlFBbYVtge3WCyden/nLe8qL6
 PPv3LZ8wus4fpXVEReUJfORc4XA+xqye5MKt4BsbwoqMWqtoKs3oZ8P1PZeZ+lQbwIAy8EzlZC6
 Uq4HvA4CvGbty0T9GG7PJS+N1KBQBA==
X-Proofpoint-GUID: msSBgGuBRL1Sw3U7cN2EhBD8fEjuV_09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180106

On Thu, Dec 18, 2025 at 11:51:30AM +0530, Venkata Kota wrote:
> The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2:
> 
>   Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-kodiak
> 
> for you to fetch changes up to dea906d655f69c09d06676132b18b74b4da83ce2:
> 
>   qcom: Update CDSP firmware for qcm6490 platform (2025-12-18 11:45:26
> +0530)

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/829

BTW, Venkata, could you possibly switch to opening merge requests
directly on gitlab.com?

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update CDSP firmware for qcm6490 platform
> 
>  WHENCE                |   2 +-
>  qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3641344 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
