Return-Path: <SRS0=PJYo=6C=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2680CD10390
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Nov 2025 09:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAC8FC116D0; Wed, 26 Nov 2025 09:10:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DAD4C113D0
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 09:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DAD4C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8tjaI1522175
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 09:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Eb74LGR4RK+HIEr16I97tFIW
	MD7IrFFqiCNSDZk7RGg=; b=lLb5fGoyytzPnwpfn1qMZj+TeFJ/tnAndu4GY0XY
	ABugwRrNP+trhaBaBY/kA9zhzdoohAHzWGhlUaMmTX3x9h1UQ1StGHcNTpxWS9In
	ABIImhFva9ripAumNO3aAgzBKxBzy6nOSQEHuuWYZGjsdURGf9ekKEQEjzzAt7+t
	1bUTMK6nSRRq3/5Gf+/X1IucZaANEcSrLNHW92jgUFa0bpfcunubp6EW8tGZKvrG
	C/T2rc2R0fwZny21QyRLGcUUKdZXcoM9Tc8wbbwvlF2gdCq6JNYlnAnrS80itBqF
	cyxjJHtwF3/RLtg6LqZizpi4sTH0SHuWaJA8zhRWdfTb1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anxfk01we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 09:10:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3437f0760daso14431987a91.1
        for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 01:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764148252; x=1764753052; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb74LGR4RK+HIEr16I97tFIWMD7IrFFqiCNSDZk7RGg=;
        b=G07HE47oaXIvpLNTWVeiTvOzVG2821jETBd68RfPiO7/BOpNS4I6TSz3WT2htgTxoV
         QHSRFk30AaZyRnUxzeBXqE1MLYG31CXDhrn3Pm14YJad6ePXRvp1m1jjwbXqdGUaOdm4
         aPvVBeaOMC80HJaQO/bK2vR3sS3rEO1OTigQUZhgRGtpojVL2Sat4M/tXFYgxTpnrdlP
         BAYZKNZK2qjD1zmDuPbueSWs8HSUIaLIjrYNjnAJCOQ/+elRkxwpBoNSL5oHdY+wg4Cp
         onknIQ45jyCmiX9Ah0G5FVa0y9a7BiaahvgMoaksIwUZCsj25mNm+48akvQqBs/dbcdG
         DVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148252; x=1764753052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb74LGR4RK+HIEr16I97tFIWMD7IrFFqiCNSDZk7RGg=;
        b=gAssmqnIxsXuCv2b4URw3F5NGV7NIUXHlqTJXbpFnNdqgmqxMApCxBxDg0ZSGqR4yA
         g3YXx6TshBrMTjS1aiYvKCQgSHr9IyGYwZLbLSAk1fVEQiq3RdD/ipE0DALlVY5LlPIT
         xgpfQMUuCTkW1viLyuy1cdxBQby7SUwC7dNEikOqDijtXltxwsN5B7Q/8cyELgjmoKly
         E8VjNwvv4Cxf7OUdxutoGVhOBANFmD/wXvVfYHj+SkZ1JZd41Z7LLK+4LgkUdzFoMOyg
         iRtuevs37GTK5adajZg6nryAJ3v0khuDkHJ0ZRUTITsLgtgTOhtWJw31R6xpjrUdgbbZ
         V47g==
X-Gm-Message-State: AOJu0YyOxDENbcZCVP277lfpdFsSMiVXq/4D+XZ9Iay77MeHn9at7/mi
	vrw1D2o6IJuWizBCtKJp5oqRJnL48Guh8sL8NW4ZQ+k0JInHMvNs8p2Rgvt9NXHVxHzfGbtzfXh
	8TImqGVNWldWaQ3hGp9od30gtFYOxdrA9WBSMJ0+88HfN8UWArbf8R3G6bKN8PqQgp33xCdqDVo
	vUnJHLcYPwQAECWUQUheaH5F8YzAvE4L20aX7k/A==
X-Gm-Gg: ASbGncutWCGTZsGl2elq7G60Li6/WvN2EpR2UAx8jPqL2AOUY/gfpjxmpiUK7cuW9aY
	9QGRD5xsV4rWddX+oqTv7q8eAC8UIrzOEn0nuYClcf+502mtugBwY/u53meOuMbn74PjfBlOMjG
	jHvnOus7gW4tguECBSi/jaHmKEIFfsCQNxoYMgTLDSLs8feHBDf5o7k/WHUN73ATeAILiTaUuyi
	EFxeePW
X-Received: by 2002:a17:90b:1ccf:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-34733e4de6emr17087014a91.3.1764148252435;
        Wed, 26 Nov 2025 01:10:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5RlZbAsK76NWAgMQJHXmKRcfVNW9rrW070mKilObUPSWEriZ0WGGXFUjDEGVbCth2eS1oqTuMXZ7TOicC25w=
X-Received: by 2002:a17:90b:1ccf:b0:340:ec6f:5adb with SMTP id
 98e67ed59e1d1-34733e4de6emr17086992a91.3.1764148251944; Wed, 26 Nov 2025
 01:10:51 -0800 (PST)
MIME-Version: 1.0
References: <61358457-c80b-8940-4ed5-22601674de97@oss.qualcomm.com>
In-Reply-To: <61358457-c80b-8940-4ed5-22601674de97@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:10:39 +0200
X-Gm-Features: AWmQ_bmJvjv0VeoAepl0m2WGiHW1CTUbammtYBBEigZDFbUldjf5R7vG-8X1cqw
Message-ID: <CAO9ioeU7Oyn9m55qE==SdRS_TD_84sb8YuDrtBoNd-qT0a-tWw@mail.gmail.com>
Subject: Re: update video firmware binary for SM8250
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Ea8ktLEVEnYkn9_6ivSfUJUkMxFcDuWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3NCBTYWx0ZWRfX3vbVKK/DrWd1
 opw5bYdVCCHQnzEw/9ts3S0ciRr1zz3XNed87YUqcSqMQRLv53x4pKdDSqqeqXehJfkdxrGjRIo
 EhCFdViHFO5g9/cfMOsLXLjeHEUunFiu8RzHVc1OEj/kfYpfbmgi017IYkD1bFqHWc9Sbo/4YVC
 AASnEBBDj7Tf7uVxceyKiZYfhGngWehzPhGoudvLAA/EBdoZQF00cmiR7PgG4JPv05fAqA8c/Lr
 wTy+WfAb9vdyxM6J+zk851R0dBOKZSIiwPsmYO9s8ULkQnbnVc8JG2S2kW9CQnAwFtZPdQSkaGh
 jGsrGf14opYsTDizwerDUNy3DX0uhkuPU/qmimjuC24STozQMqt4NOlwRU3lsLcsITovH2WQq3w
 Gvt90H6mweoErOz/0wm4IQEkbMHspA==
X-Authority-Analysis: v=2.4 cv=H4LWAuYi c=1 sm=1 tr=0 ts=6926c41d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=NI4DmBPqdbEpsFrWdosA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Ea8ktLEVEnYkn9_6ivSfUJUkMxFcDuWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260074

On Wed, 26 Nov 2025 at 10:46, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
> Hi,
>
> The following changes since commit 23568a4b942079631c9378011aa0a9b29de19370:
>
>   Merge branch 'intel/guc-v70540' into 'main' (2025-11-25 18:40:29 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-update-sm8250
>
> for you to fetch changes up to 095130d8e395ab4b5d5e26f72cd3f0dff94036ae:
>
>   qcom: vpu: update video firmware binary for SM8250 (2025-11-26 14:08:26
> +0530)

Merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/804

>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: update video firmware binary for SM8250
>
>  WHENCE                |   2 +-
>  qcom/vpu/vpu20_p4.mbn | Bin 1985348 -> 1980084 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
>
> Thanks,
> Dikshita



-- 
With best wishes
Dmitry
