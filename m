Return-Path: <SRS0=uBoP=27=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5EECA0EF5
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 07:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59F73C116B1; Tue, 19 Aug 2025 07:49:46 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6A8C4CEF4
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 07:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E6A8C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2OFSM016840
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 07:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEn7K6wHYYcMmbEAlQ5oPI0BLoOmSO2Wnt8HTW0sICc=; b=ad+Mpen/YcUpPplL
	S/nRMxSc2vjuyfH2RwSvKZ2np7lOyypIIzdTM+PhBqNLsO/1Id36u0HbX9fmWoML
	3WqS5pU0PVoV80F8jdSZ8DXPfOFxKFzEWj2Pqwk36f129Lo/WW0s8unGcrQhAf3Q
	sxxsI6Lk9/Qef3YM+gLJO7+WNh8PValyFBJSOd8S6JCgbu8ypXT0c/NNLaugLUOX
	cJZFgqHsdUWoZerVORxkm6Bj2MKTc8YJICmYhymWXHMIyqmuH4MpxBsi+ylbrz0S
	sgv2lgF76nvDtrizRjjmeXO1ETbD9oNqVFbijLOsF/M4crjqwwJh1yRuQzaeFES1
	M8Refg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyfpbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 07:49:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b1099142e0so144999581cf.0
        for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 00:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589782; x=1756194582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEn7K6wHYYcMmbEAlQ5oPI0BLoOmSO2Wnt8HTW0sICc=;
        b=HAN6nFTdPHWJimi+xoGxRnxwSEDIS89DVUMvsc+YyxzJhQ27A0YAdB69dNgN5ZKsnB
         M18nwU4t9nWYRirXVsbWVQeX9LdI0empX7Nq0XNoVN///Kw/Nl3OPh90xZDHdYq27uYV
         U0h8RcnFIWlvFiyajN/sT48/kQ2JJ1G/WcsZ9YiU1mCmSTK4aD4k5lVx/K9FtHnxujec
         LYcUOQ+q7/WQflf6eNLjb8fwEkh/OqO6/T/FfHnslHXbNhXOoXE8TWr3NbLLnP+kiEIX
         R+E7lrLJAtvNR+H48gjcwn+wMNUR+0yBBMgKnJ5cLue39Bqim/Sm/iMuQKP5TnI71eo3
         ZWxQ==
X-Gm-Message-State: AOJu0YyI+H9wSzqYqu733tw3IB7ORI4wtZvUGHShj+mIxj8y0wel46qR
	SWpFaIxdd33k1NxrBvUrvYbRSWRRHEHuDvooInUMSAptWKabBdE7Ga8rXwcO+Y3kRrATut8w4hz
	R/YC+ZdPVMOPZG2i/qjsTKr8WZIJxJwzkQ8gCbvozmDRayAwbbniwHs6N93zhNM4=
X-Gm-Gg: ASbGncsODYC5H+vxjzszl3rs2YSy1PIjlO1dN5U94FYnGrvSWzMxinKuWRdUNdEqeSs
	vG/Z75X7nony3tIxWZ7JKsxYLM0+OB3wFfbLul2oGE8PfRdMy9XcCBTfhZYpCYClJJl7FOr1LXb
	ExX4yC1Ttn2UX/ywyGMGFmMDvWECNdwGu6jFQC0tqarQq32H7yvr1gQbxuZmMnJ1HViFOLI2Pis
	KABwjxYDswELgRRrhj/CDcxv7wOiHJ+ubj65Vh/uzryauZ76V+wb23YWEiw5REFnyAiBgP4IR7A
	/GaqD/0phBRxhasxdyf1H48uUhKqdDMhK1Z9rsWS88mh2rckSHkVBUMU/sxXUSXDdBT1jpdRrVw
	PoAihL1WrGQFwzwB941i/QEIZV2dpeTshNe6hrInHJjIoEl8cbVbO
X-Received: by 2002:a05:622a:22a3:b0:4b0:82ee:f732 with SMTP id d75a77b69052e-4b286df8475mr16219151cf.53.1755589782177;
        Tue, 19 Aug 2025 00:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSsyzpFmlz1q9dJ7bBbRkFq/VWz2r6yPKFZ9Rum1pGsIOx0QtVKRZNKYe+5zDiOqApLLw3hA==
X-Received: by 2002:a05:622a:22a3:b0:4b0:82ee:f732 with SMTP id d75a77b69052e-4b286df8475mr16219001cf.53.1755589781492;
        Tue, 19 Aug 2025 00:49:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351685sm2015191e87.36.2025.08.19.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 00:49:40 -0700 (PDT)
Date: Tue, 19 Aug 2025 10:49:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for qcs615 platform
Message-ID: <uc3bl7dob6t3knn2wf33npzefgomwxjhpanj6nz3ddbwaohwnh@rnktc2ypyxsy>
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YOAiJ7Wegbi4rEv0ypCdGLIqgt0QhKRU
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a42c97 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=64ak8CJDN1AF1395YwAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: YOAiJ7Wegbi4rEv0ypCdGLIqgt0QhKRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX/Xd9qVHMkiOK
 AaIlEtcOsqD9E+B0xg+BS41sHNuDRwt/Dqsp1yvU5iyD1amx2LcqNf0f577DiHc/CdfYlw57Krb
 dX/ZgAT/WmPNY/bDKCplEdVeMY6tA6/d3mlVTaElu3g96MMDd47FBuKXxAhRz7U30Zde2enGtQr
 j3BnMcvJHgh1hCpZNjwSM7mzaq/KA9JHi5TXw1SrzQcZuaaSOG5S06VWGvwIjCG3LI6uRxXlUBo
 L/6uDFp6cb0vVbZlC2uty7gWhgMp5pQCNVE9DPlE33RQO02PYJqvFJ2yJQRpN2umIwnOiKcWC88
 e0AVfVxB0LdWnIGAFZMHEs0xpTEBc8UOSmXO0iN/GMP4s3tdg84gdKPO0Vq4JuuuU+NQp64J3FX
 bp+t9qE/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On Tue, Aug 19, 2025 at 01:49:48PM +0800, Xin Liu wrote:
> The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:
> 
>   Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp
> 
> for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
> 
>   qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add CDSP firmware for qcs615 platform
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
