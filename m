Return-Path: <SRS0=Ii29=U3=oss.qualcomm.com=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B666FC02194
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Feb 2025 16:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74962C4CEE8; Tue,  4 Feb 2025 16:59:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D4C3C4CEE6
	for <linux-firmware@kernel.org>; Tue,  4 Feb 2025 16:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D4C3C4CEE6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514EWgoJ016972
	for <linux-firmware@kernel.org>; Tue, 4 Feb 2025 16:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m5xRbtahHf67+tT1W5aG/S00
	eDCUMSTm6m7RtxHaP/c=; b=eS3FzSmK+eLeu76zF+IOpimhJmTgjGvNuLUYqwEF
	ev8h8O+CipW5T4gdNkOCfNY5DPTo+t+6GTCZueOyoDZ2zmCUPhs5fKqBN9u0+g4n
	yOyt3ygKYB1qCZgG7wCgjTYxDF/nyOHCQZMAWpP/z++kPd5NilJIZ1D0dK0+RFNK
	0X5FWoJMPM7Aiq5WgVW1FoBuhJ9kCfFTQhNY95sDCgciCSKNH0QO5G6/zNFfVTFG
	kWlM8c/XaIU9QHIlcU8SQgo+4+7qVcNOC1Pcz1+SDBz23sa+sS672k8nAZQvbg5j
	5w8Ix/y+oKTGK8JnRMy5nDcxRwOuEGPf2DMY6B3vhmIa8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre0bvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Feb 2025 16:59:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f9c34c0048so2675865a91.3
        for <linux-firmware@kernel.org>; Tue, 04 Feb 2025 08:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688347; x=1739293147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5xRbtahHf67+tT1W5aG/S00eDCUMSTm6m7RtxHaP/c=;
        b=SwwNWyiULa/jftVUN2Z2peTcwcUJObPDaD8lQ+hvTgBYtGhKJ3fuoBuFw5QAW61OZs
         Ty9RmP89XgNAOhKosJmn7eCx/9vgB3CtviIoaHN9C8+xYe9prz1c7YD9wP6UC7IocXuJ
         ZbmCI/NkH/fYKaPOAVRWcUToXII0gdISXe30h9s+MCWPLaZhHthQmtaNDqjmlGNIaUPT
         nDKATFWnAliwSz7mOGAUXPomIEBWvVL891sjLdDy9HuVHvWSFGVsE6v0vH+PygMHHiuc
         5wS7HQ4ntftSjqjwwxkIYvgEa9OUGD4qohfCImBWWJjyy3AFoCzOWo661qX1exDL+MyW
         L3uA==
X-Gm-Message-State: AOJu0YzniujH3492YCeVPUZVV4mHHZOkgFLjoiCH1WrH/2exFtF4cPeV
	6K+b4bb+MDbdXHP6UfSqXJcDdZIu8hr4jRusCY8y2rBfpWGBmZQdPOmLncJM7fRTOu8BPf+k/yp
	WZz0QAlaaTAI7L0SZHeMiRufOCf4UgX/LfQTyYzy69yIJYXbaVSOuOhzm1HPR3kcI7uM=
X-Gm-Gg: ASbGncuo/mSUcgq2n6SFtUkGvB0nS2GoPlCXsxOqgk8QmPcyv0uQO7W+SWqvyAb7E3V
	skxIv9BBajR09hkOtAZDu205VcUU02/4GB0Ajss/DFk41sf2KVakyH/QhvHcttt9tL6fhoptJrj
	teTP3QGCEtZdulHaIldsGCcFVQH42MTOrAvjraHvIhleWsahnJ35N7NKFrtX+ioT08vJKaBQBXt
	HXRKCN2uody3qR2cQZ4NcQc/51NkPlU6SQQGflLGKRUbQvjT2tJmblta820ceSMeDMOcGVnFFJA
	rE868i/HKJAteNiOvpWZ5Hn5/uBBGw8GiJyUp3aPbHF6uLWbZvlNKbA2ffgFqHXt
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999336a91.12.1738688347089;
        Tue, 04 Feb 2025 08:59:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTcH4wyAt7q7aTLpPh5THV7kuWDRCPr1YuScJ23G9Z+DsK08914h9Qwkm3YHDVTWmSOOVVgw==
X-Received: by 2002:a17:90b:51c2:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f83abdefc1mr46999303a91.12.1738688346786;
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm98992365ad.99.2025.02.04.08.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:59:06 -0800 (PST)
Date: Tue, 4 Feb 2025 08:59:04 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
Message-ID: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
X-Proofpoint-ORIG-GUID: NJa5r9yxcbcRIskOPc54ylXrpgu7_2Ql
X-Proofpoint-GUID: NJa5r9yxcbcRIskOPc54ylXrpgu7_2Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=767 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040130

On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
> NAK this.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

> Compatibility links are added to follow the names in the existing DTs for the
> QCM6490-IDP and Qualcomm RB3 Gen2. If platform maintainers think that breaking
> those is fine, I can drop those link.
> 

I'd prefer to keep those, as these paths are referenced from the kernel
packages in Debian, Ubuntu etc.

Regards,
Bjorn

> The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:
> 
>   Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> 
> for you to fetch changes up to f0e750f347227cb1e0008715a27b2020399b5efc:
> 
>   ath11k: add device-specific firmware for QCM6490 boards (2025-02-01 18:10:11 +0200)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       ath11k: add device-specific firmware for QCM6490 boards
> 
>  WHENCE                                |   7 +++++++
>  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn | Bin 0 -> 7734064 bytes
>  2 files changed, 7 insertions(+)
>  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> 
