Return-Path: <SRS0=gDYE=4R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E5DCAC5BB
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Oct 2025 21:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BAF6C4CEF4; Wed,  8 Oct 2025 21:07:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75742C4CEE7
	for <linux-firmware@kernel.org>; Wed,  8 Oct 2025 21:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75742C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5GN6019393
	for <linux-firmware@kernel.org>; Wed, 8 Oct 2025 21:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SGCNrzek1xPSSiWbxw6pVMTx
	tWRzGP4RHnMrfvkJzmM=; b=gK9K73KgDYJj/oriPL3teCRIT78TzobJFYOU95i+
	O8O1KvrVX2USrKGFAClfDKFJExok7paMrfqLDpVfC63IHO/0LGtUBLjVHpRHL8bd
	9lZUUiQmG6nPgYVOhpQJDY7XMChmHj2FEbXlushoeYYSBUpJjZJAJTpzGhpEskBn
	c++uqo2e7k+kolOQX9BvLlamC9wwPlbmmfvI0s/G1cKqEj+t4UimYYHWwGhuAyVI
	CrvTx6JFI91gsZic9mXmoJaHZc5p9hg9McNGNLuo/e7raoGTEaU1w2kGC3DVzUwh
	UCJ4ZfUL1kzcnax0wZiTrhHohhVEZ6QU8i/bAQeA63roJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a8k2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 21:07:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4deb67c61caso10976391cf.2
        for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 14:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957671; x=1760562471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGCNrzek1xPSSiWbxw6pVMTxtWRzGP4RHnMrfvkJzmM=;
        b=NOVVH2xSNJuWTCIHy3t69BKvQhFMfS/jV1g1VF10/ZgTz1zzWz8+z7A8Tv4Y7AjLjg
         R0QKbo4EthCq7e4DWFXZWQjS3a/YJjoeoPqsM/HqvuLqBgmFqC+TSuo6TIwiuqshcCMW
         xV9rW//uSrI9qwEjZ45wx+LI6qgrc30VnP3sSUK1RvbRBgAEBi6xcThtrcBIyQmATTFE
         Hvv9d3H/HzfuxLNLQPDsYFuPFDoPrYNn1DN5sMwf3qMAaHMM48HCqcaQw4sgg1ACkeTc
         fpSzc6XbGmEvpx/aINqll79R/7UsYkBH1HG60IaEjbFOgx1YYTSRI+apfFhf7zs0Twj0
         khpw==
X-Gm-Message-State: AOJu0YyBQxdeZzBrp8r3TPo2gCFxlSyHcZgb+Xuf4Qo4yRVVuEdoBxnA
	MW3IogSqB2OnY/8PIhTBYxmJwylyuulv96eLrsG2HlJlhWq10ZVbJbM3geodvXLpuT6rl0MD7Ih
	kxHx+ZVsd+CnPieg02j5cp4gxS+DSz1L9XD/mqriJxzA9x9t0u+x9RBAAIo9MJ0U=
X-Gm-Gg: ASbGnctabsRT9Y4u0pK/TnS7WcfZgiOo528wzJlcnQYCth5pbmBEv2CZIW46ZDZBifS
	5VsbhS5ut1dNBKXFtyssVyFk69mqIp3lq3t8w05utiYECfAtgCKpQa2x9hPFs273PcwlsEsGTvp
	9n6O82Diby3zXc8Rnrx01Gd8QgCg+9vehQ5xy9IvsUWKmED1EH+RqMt6ri5gzGEqLN9ORrEA4ex
	2m7abA8KcRqQ4fRnQyTxRhKr/qrHiiCxzgxdIxl7HoFtHnTHyKkvMEKAGuq4Gpp3aPSRKmiwHF3
	/Bm87f7vKolgSlOyhSY4Pzvbi3fq6HPvHVfifQ74IIX+A4BabAsG0baUY9F9Q4GEAeqaYGGVQZH
	FQgmlACrN1uzdd/8AoRdtTQFU+L6HC1t1LhyM/id+m5pQLu3xkKjyzfVlig==
X-Received: by 2002:a05:622a:4017:b0:4e0:93e3:3e7a with SMTP id d75a77b69052e-4e6eacb19f7mr72272531cf.1.1759957671171;
        Wed, 08 Oct 2025 14:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnUMdKBUTGN3NM9MuH9tLx1mHVjaSkOYQ91C+hSGsuShl+/R0DmqcD1S1H3SWYR0a9Pc2+YQ==
X-Received: by 2002:a05:622a:4017:b0:4e0:93e3:3e7a with SMTP id d75a77b69052e-4e6eacb19f7mr72271991cf.1.1759957670566;
        Wed, 08 Oct 2025 14:07:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907adb4111sm349290e87.111.2025.10.08.14.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 14:07:49 -0700 (PDT)
Date: Thu, 9 Oct 2025 00:07:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Kaanapali/QCS615/QCS8300
Message-ID: <6m6qyzti23x5h5wb5k3zui5ixpvjnswozhtfmwwowopqswqdoo@6ckuycojgn5w>
References: <00280310-a655-4251-b3b8-a5ff26d0cd97@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00280310-a655-4251-b3b8-a5ff26d0cd97@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXzLniI1Etomw5
 Ftf81fdjLl8adL4zdxhJAfSqiHP06pnttiPYkmOVpM63jvlr05kLIXfXL3GXLGJ+Rj6aYHNMylD
 EnSQYZGLWEPqRpNabITTFSP5ODirbIWsKmVh/B2B+JYzkgIzKzJA7anb2E1vSOPkYDmKchanWIq
 FN2TpRct3nzs8xAiC90ikLGYJ8QAcUKzRYVYpQiAqmFfF43oIT2hKlta3lWF0BHJgZeHugeuTG0
 oJlmax0oc0gAGTrGcXYG1pmnlfp4o3lp0HgpAmiY4hWiwyD5nhuNuJLPkiSgijOBRnuTxxJ2ntH
 MiFZdhbyZFi4A2IpEPc52aKKfnlaVFaDD1l/irVgkhI+PRwMuBCbzJKmO5fZ6XgOTPe4Fqbvyet
 7NgubH2s751WXWlXETA6cx0rPRBVXw==
X-Proofpoint-GUID: BnBnnUHEkTJpoU7ydnT1KhwclmuZg3WT
X-Proofpoint-ORIG-GUID: BnBnnUHEkTJpoU7ydnT1KhwclmuZg3WT
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e6d2a8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=8eAdzd_FdOyOo6QMJ9AA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

On Thu, Oct 09, 2025 at 02:08:27AM +0530, Rajesh Kemisetti wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's Kaanapali chipset.
> Also, updates for QCS615 and QCS8300 GPU firmwares.
> 
> -Rajesh
> 
> ---
> The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:
> 
>   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-oct-9
> 
> for you to fetch changes up to d387533db74fa60ee973007d6ba2455d9ae054bb:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
>   qcom: Add firmwares for Kaanapali GPU (2025-10-09 01:17:50 +0530)
> 
> ----------------------------------------------------------------
> Rajesh Kemisetti (3):
>       qcom: Fix QCS615 chipset's GPU secure fw
>       qcom: Update A623 GMU fw
>       qcom: Add firmwares for Kaanapali GPU
> 
>  WHENCE                          |  10 +++++++++-
>  qcom/a623_gmu.bin               | Bin 51544 -> 53516 bytes
>  qcom/gen80200_aqe.fw            | Bin 0 -> 25880 bytes
>  qcom/gen80200_gmu.bin           | Bin 0 -> 108518 bytes
>  qcom/gen80200_sqe.fw            | Bin 0 -> 118100 bytes
>  qcom/kaanapali/gen80200_zap.mbn | Bin 0 -> 12088 bytes
>  qcom/qcs615/a612_zap.mbn        | Bin 2977 -> 14256 bytes
>  7 files changed, 9 insertions(+), 1 deletion(-)
>  create mode 100644 qcom/gen80200_aqe.fw
>  create mode 100644 qcom/gen80200_gmu.bin
>  create mode 100644 qcom/gen80200_sqe.fw
>  create mode 100644 qcom/kaanapali/gen80200_zap.mbn
> 
> 

-- 
With best wishes
Dmitry
