Return-Path: <SRS0=YtFo=DK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA436CD37B6
	for <linux-firmware@archiver.kernel.org>; Wed, 13 May 2026 09:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90C2BC2BCC7; Wed, 13 May 2026 09:42:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA708C2BCB7
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA708C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p6XV2338787
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=akXK2vVi1tFj8M6oyKfP2+bT
	2mFYQrVcLBOxx1zRKGo=; b=CKWEesezBH8dhNiXpWnE8jG+58j6ffMa1LdxbWS2
	mp7hd9mvsY3fGxZc1c3fFn4cFkQZ7b90Tkxq/m+mgUQnGRpV5D6LCz4Z2BDf1Bh1
	vxpOPnQOUacY2iqjX+ivdLVwQrcyrGZlJATHhfXO17LULPkMj88h7sPnvLnc2dnY
	K5nwoouV0g1Wfs0fkjX8u9pKPul1iIjcRltPBvdxMv6xE7C+Rdfh1Pcp1dvzlPk/
	hkfhLmOU4ohV8/Ny42DqWJu1PIypYX1dthhDY/RB/ZVNAEJGK4AsmKNTXcHh8KbH
	xKXO+FVOkAmF+wLgDDPDN8smgzNn0WbicGG8k0TurM+0lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxatjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 09:42:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso50680681cf.0
        for <linux-firmware@kernel.org>; Wed, 13 May 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778665375; x=1779270175; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akXK2vVi1tFj8M6oyKfP2+bT2mFYQrVcLBOxx1zRKGo=;
        b=PZOxVfvvShWJkG0VY7icTZmB2XynYzskahGZPAE4KlrGWABqmSFjSxMt2rHrSq2mCT
         FnSYBL+i8DJrT2Q8/A8Rl7J22SdDrjTguVjJ4gmm2plN8CSBJR9seFd/X3m7r19+Y3fL
         Lmch+k+zz+d1QRaRRNDv9Sk//UatEmnIDBNSu0tpMewM/VMMfwGchvYp3obZ0HryMGnG
         oSOLiVunrSP1Yip+MPOHk9KYSQtGUR5CEqEcKP8j16m1C/LGGiqkNbzcwr8gqnlmWgUg
         17KiGyCVFRbpNYyozqcjq/DNpOYnRWEsETgBa9bN2lUwLkqrnZxDrMiK+dHhbIeACxgn
         p6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665375; x=1779270175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akXK2vVi1tFj8M6oyKfP2+bT2mFYQrVcLBOxx1zRKGo=;
        b=YhdV2Gla2NokR7uDYA3NgB8tWBb1R7xVGzJxgvvqBndu+Q1qiBO74ZI553m8tCKU5g
         QJ2PzmjbS3FLV2pPZuojii4943BSgOwkrG/JlZiKRir1e33OeeflkHVSi0Bh+95NCHT2
         asSzmU0xFPYCEM1W/2R1k5aPcZ3RDJwhG0qxS4kxH3uDRYOaabWl3/h8CTOVOEq1qVTs
         XpQWkDKB0mA5K9onyKgkzm77J2OmMdxGh4mRAkuxaD9D/3FK8DC4R5TXvwTWHyb2Unuy
         3KtSpe3k+dupNgDc8g5gXQfNZG3th2/wd+Tpvpt1EImnmALAfW9h7hqOS0YnantQVABu
         mE+w==
X-Gm-Message-State: AOJu0YyHYa80gbBaAWsQ9xLBFpkY6GU3mh+hs0p9ol58KEQ/wmbHQOby
	36k1DMo8mxDygeh/vAfsLdA1SBLgu1T4IfL/gnIC/a4ZgQeRENF/7wEqjU4khIxzFnmweVk4bnp
	VXI/91lkvk3xrmbLebymetgyz51pvjn7GOR8zqmozNpmKGKYec88BLMGxhkCvQw4=
X-Gm-Gg: Acq92OHrJm8iLqWS3In+t18kCXzRwiRydMUT3L/VzrS0cqzNKX5iIaEJee+GbNVZ9Zi
	AhkjbTWUDDggmhR46UJzThAS3+EYb2FDxWejY/R7cpVAlFlkT77ibMwvJg/psEETvElcybBsy9/
	nWehptRRTWyFNzPJWSj2BVuiFMW7rA2/yLI60CmYFJ5FhjWaFZXOeT1+hcqgQFpyXg3nXVQEjTy
	2P4OTOD8AczaMjCc8AuA0G6LqXyPv1LN16bWVkv0+CChZy44ddLMdqRcZLbTYZWCXC4s3LPD0e5
	XkPfPCLkSwjN5fljdEGkmIvxAsGF1+pU6eyYHYGBboSI1LGpxhvAIf5XEXm4YuuRzoMcNGtLJ1y
	CjZyX6BO9MtiS3dkTsttlxtF24Eus3DQjxI5hQ3EzOCqYl4fMHODQGHGrFycLneojcqlzynC7yu
	gsxMM6N60cCl13uohCLMjrfWkhQPy88Cs3pH0=
X-Received: by 2002:a05:622a:114e:b0:50e:5fde:3d49 with SMTP id d75a77b69052e-5162ff4645bmr27404771cf.32.1778665374780;
        Wed, 13 May 2026 02:42:54 -0700 (PDT)
X-Received: by 2002:a05:622a:114e:b0:50e:5fde:3d49 with SMTP id d75a77b69052e-5162ff4645bmr27404571cf.32.1778665374267;
        Wed, 13 May 2026 02:42:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b251sm3900758e87.77.2026.05.13.02.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:42:53 -0700 (PDT)
Date: Wed, 13 May 2026 12:42:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Add cdsp1r.jsn for sa8775p platform
Message-ID: <r5b3goppg6uubgndmjc6bv4a2uqjk6lehewevp27hdb5qzx262@qz74sj3n2z6s>
References: <88bebbd9-aa75-4e53-975f-021c8642e61d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bebbd9-aa75-4e53-975f-021c8642e61d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1Yvaos-9U9DUPNpU5xP8fo50PtD4OhDW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMCBTYWx0ZWRfXwqBl9PwCItuW
 WnOzgW5tmHH0xjHKiZIZfKx67TAzJb/JWcuCStiwRqf3MqIXAwyny6b9z4Y4Rm3hyyKFvh/+MLS
 W547VdKfwCg3TeFFan5oIdzMmIX5JiDn7+k+91oWJH+LZhu3ZNX2yu418gc6kYpHOpFj32j2Efb
 8z4nycFM7p4rAGdkGmTNTl+6ieBpqBIfhaJnUnkWTGluzI4Ijk0Zc/7ijQ+M8G31ubkT7kLyaE9
 OA5lgkbq+5IK85AFBts/vqFUVZj0NeitWyzI908kPtCCnf2M63OoYmFq9vzRukpsiaEGzq54X3w
 kN5U3kNX8C1CWaEXUbcBo1GM7sYwEll2ZJ26Su9bwAWFvf7Wu806uV8BirbeP8Q27524uMC6zoY
 UUs+wJazlwgwVOONarsDz5ADscJsPEKcTINE1jKuXyNlpr8aOmva9f/gXltJTEr/pNsjESxx9vK
 HuIN0PJLfLH254KVZjQ==
X-Proofpoint-GUID: 1Yvaos-9U9DUPNpU5xP8fo50PtD4OhDW
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a04479f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=xhk-E-i1MfSOnhFXcs8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130100

On Wed, May 13, 2026 at 02:53:02PM +0530, Saddam Patan wrote:
> The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:
> 
>   Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-lemanscdspjsn
> 
> for you to fetch changes up to d2e0a05bbbd1db311383369ddb84bd80e09969ed:
> 
>   qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-13 14:49:27 +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: Add cdsp1r.jsn for sa8775p platform
> 
>  WHENCE                  |  1 +
>  qcom/sa8775p/cdsp1r.jsn | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 qcom/sa8775p/cdsp1r.jsn


Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1047

-- 
With best wishes
Dmitry
