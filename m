Return-Path: <SRS0=L+Kk=6E=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BBFD116EA
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Nov 2025 09:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20682C116D0; Fri, 28 Nov 2025 09:34:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0A3BBC116B1
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0A3BBC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Nveb4191722
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejMxiRVIVIu6XD3XI/afxZtxuKkEfK6TAywsnZN+xHU=; b=UdLSNK/CymOYvi7G
	VnwQCwlKjqG7ZWYA5M6FAyB59TIS2vpwstGfNMzyVbrGSXo+CBm7Qg6kWqd8pCL9
	8yPtax4JiQmQltP2/M64lhQFznpv/Xhqo3P1FQKpvuo2xdXvMwbePh+dIqty//lS
	hGyJE3+Jp/itgkz+2xT7WFFAjTxfEI8OZfTZUJ5tsWKhSslLazggwC9tPULRMerE
	qLIXLF3Sx3qzrDyvk335oZd3XU7KBWrJEAzFaPfv4rm8d3DaESgZEt0PmZwxV9Y3
	xdn4KRPAe7IoXxekCKWdbeLJOPrmqC5bPHE9glPTljGGzuOK11cChnY5JPDyT2iP
	KbvyqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fgpvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 09:34:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8804823b757so53872386d6.0
        for <linux-firmware@kernel.org>; Fri, 28 Nov 2025 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764322475; x=1764927275; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejMxiRVIVIu6XD3XI/afxZtxuKkEfK6TAywsnZN+xHU=;
        b=cUaDbC1RrZhyMowgNdWwMp2DwxlRhff5Zml5NrvVbQebqAf0iK67W0dsamUJqLL2Y1
         DCr9O3HO1i1Db9aZtwnmarlD/UeoCgPoKrKydHLvbRHiDC3gRacK9P4iN2OFiovGmp/D
         H5EnUYUM50JwuLlRarSHmQW6RCKHpxXVHjd9lLCnRAixuyQiW+Zmqa3L4sZx/t2O4Npi
         IPOIxpH7UlKoX1HNt9BH5QyXMw3OQVve7L82dDg1Hqzp5xA3KdwTsTLChIRTKdBdGqLJ
         WDvPjhy5/aRCq55RsHAh0coJSEdk6hExpJSmHOGRArynxuqNIsBrRbuWYQuAK5q2ZbIZ
         wz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764322475; x=1764927275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejMxiRVIVIu6XD3XI/afxZtxuKkEfK6TAywsnZN+xHU=;
        b=AeS463nDn+5FL04Zr2TdT1wr96fvA2d/l/tFxAdbseEaXyVjww1NstBjvigoOKOyta
         A/4WkbZqA53oD3hdPp6T77ubUbNdlgHDQ5qb5X2s2s0vR/o3yNoNSaPMKjTRvPB8g8Ux
         Zor/Jsg7flgbajahWxvV01wd5CQbZYCdOHHkiTaFl6imFP6wWjcu6XUzk4A0ZtPJTW0j
         BQiVpwRO/Fi8yw85XK4VF/U9I7ZJ2HC4t9Twyg/Qan8gWd1mrzAf0CPj8O5xT7vkjYdN
         OPMEXsRARKlVbEgKsVnSIO1CID5gilQV3s63h/sDggFj1pvIv/sLlrueEu6zoUn5vyWH
         GU2w==
X-Gm-Message-State: AOJu0YyaWDP3D9+vnXipdbjIf81aMgacPYxAslVgQ8vLeYcQcQmqUec2
	9b88fw4WZZdAzMIWBzqEKFPxGwnxpAC2OzQMT1AfBKeRRTYfduHZynszxomJeQpKoCnUAGU9YHr
	oHqkBBfFs9VCsOriLnnZsW42tsaqKmttXOTVYWgTfoz9en9ZeNVgvaY2g/PzHBYnjcmjjOIw=
X-Gm-Gg: ASbGncv//RGMOezUmycWo1Tnae334h5135NbWVkaYNB0ZfIcGXkcJMbqQakSh9vuLv6
	YewIJMP3zKfwSfuWFGgN6NqlsJB56r0XzWTJg8ef7N17MMbSYZHPBpVmCVLEVfuAUFeyU9cgku+
	ieDkwyVFPTTp6Usx2GuJ4fPKNt3b4NilcFqR15FRDnJdTCn38uXLg9VarNmy/PH6PkXQiZghAUd
	d4Ss1n7U8BDRaC79D4MfitM0XUUd/rYtRIZWuCKxOKk8IzkihMXD/L2gDYGV/X4ccdn7esF84QU
	u4uPqGH1br/k2N40avrFF6ix2HOwBziRvXWWg4XEkV9asUHdJO79ftkjDOG495YSu7wkta0t6wT
	8U2Gjh2NK9qrN7LZ8It3m2pdJ+/1KZrEXTmjeHTNNjvyfKN+lR4CC6eOVjmjlchGkyQY/r7lphv
	+GXUGFX9Oqe/lbu/VXK4iLMkE=
X-Received: by 2002:a05:6214:4597:b0:87d:f969:6aac with SMTP id 6a1803df08f44-8847c381b57mr409825666d6.0.1764322474924;
        Fri, 28 Nov 2025 01:34:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+uovBTnK6vNeILearAwe0Y04X8s/Y7n9NdfOrFvzP29w1PbAIAMQgFJ+DNXmkjRqbUXzfJw==
X-Received: by 2002:a05:6214:4597:b0:87d:f969:6aac with SMTP id 6a1803df08f44-8847c381b57mr409825386d6.0.1764322474462;
        Fri, 28 Nov 2025 01:34:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d2410e060sm8966151fa.44.2025.11.28.01.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 01:34:33 -0800 (PST)
Date: Fri, 28 Nov 2025 11:34:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yushan Li <yushan.li@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for x1e80100 platform, change the
 license
Message-ID: <a4pblzvdt6xngwfp7irvaap4bebdm2rt3dgm4dq5l3dexaw6tn@os6ymb3ytmub>
References: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
X-Proofpoint-GUID: pAXuGak96xr80itM-5bR18enggYkwChW
X-Proofpoint-ORIG-GUID: pAXuGak96xr80itM-5bR18enggYkwChW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2OSBTYWx0ZWRfX9ilMKS5996cw
 ZaE1pgTOeN978OG3RC6ZoRJ3gPr2dK87PoCH4g+kowibCd9poDiY0YzOBBO8zR1wN5c9mAIHxKQ
 QseIibCjt508xWSzgbnKueW/KyTyXggk6bWbxPu4AGEZdSVYiCuD3w5mpHAfDm8In7fgY/NzwD4
 Ufg0Q4uyeodjx/I80XxgUsNvZTA3zwhLsExctxyaAnR6tb+ZW8zoR5obG0UXAef0n4emvVNR25h
 k2aY9WAc8X5PqwNXjPx7ubCANgyMLMhccV+f+fHLN5Sl4hp9qdn5qRjRZJ4HIkyFZyegS80Qks+
 pEBSEAlj1dZfNL+ktCqm12TaX8/R1+CG1PS4jvDJGqFDpEsdS05EM5hyErfxDo5DYLLxHQI+JVJ
 Cj7saZQ5Y50GnBV6rx+YrDlrUdWMdQ==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=69296cab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=6UvKnX1Qr6HWamSQI7wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280069

On Fri, Nov 28, 2025 at 05:14:39PM +0800, Yushan Li wrote:
> The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
> 
>   Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> x1e80100-adsp-1126
> 
> for you to fetch changes up to 818809855970fbaf8055aff5a91a133ea5feed49:
> 
>   qcom: update ADSP firmware for x1e80100 platform, change the license
> (2025-11-28 15:32:30 +0800)

Why are you putting x1e80100 between sa8775p and qcs8300?

> 
> ----------------------------------------------------------------
> Yushan Li (1):
>       qcom: update ADSP firmware for x1e80100 platform, change the license
> 
>  WHENCE                     |  14 +++++++-------
>  qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
