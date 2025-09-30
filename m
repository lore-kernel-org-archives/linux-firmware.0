Return-Path: <SRS0=llEz=4J=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F31DCCA472
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 18:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F773C4CEF0; Tue, 30 Sep 2025 18:40:55 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3EA4CC4CEF7
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 18:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3EA4CC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBbuGB027381
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 18:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uf7bx7mBjmNw+Zl3BMLFvDmV
	GJ8MYuEeJ4oYxYDO2gw=; b=dWg1U2cJMwowOMAI2Uy3GePiwAM+m4EGr/+ihUP7
	j7HA3bgmrThZnUC1Zv+b91p9g4vnAIn/hB3g/ymvHwCPPjFhM6U2TckEAm+fwrPj
	19SYTmPe3rNDcFq/cDwr7lLY9Ze375b+8yH0mO92iJolYr3EnkEwu5rCKRY0LEqE
	TzEnIRVR9Bx6UKrB3OU/ciV90lUcFJnvu19OWfUqXstj3PBMs6M2NuP1sbBYkqsg
	63gAWuE/3qj0SHzYTSy6L/QIZskhTbFgv0Jt4+/F9/M2DGNRff+3LhhDi7FsZcbq
	DygB6F617J4aMf6F4kUNMQLusUjsHBjS7UhoPWgE1I/g1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851j23y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 18:40:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d602229d20so112148911cf.3
        for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 11:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759257651; x=1759862451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf7bx7mBjmNw+Zl3BMLFvDmVGJ8MYuEeJ4oYxYDO2gw=;
        b=wiGHxdib1TI4inrr6VUcEbsKCOWtDv/mN9UKYp9JIV9uuzIoWlIyqX3bLyjswvWNY5
         mgZp/pycwiBog3jJJbdrKOYzUA3K2rTeq69qZKstenVNMEbgn2qTsSmiJD1LWuES7Slp
         U7gsTxEEXCkrEpSaaq92dkwrK8sTPGThsbIkq/ogErYNojLAzT3kB9VuZ46iwGAkp2+I
         bNlBTu5mvj1qW5mCp6SsTiv/MaGmFP4X9dYfaLwCjp5rwdItF3DZEINEqux17uZ+mbZ0
         2/p33B+XoMCbQInSFTfotmls3yg33a6BySXbc582IISt1zzJ+NjeTifL6h8NPkwR7Aan
         njuw==
X-Gm-Message-State: AOJu0Yym6tV0xtfykDADN4RZ0K/5CGQpVbw2oUOmcIvs5lXWkaA4kcER
	GAWTT8efzkC8g8SAKKbN+28lqbQZvMCL61vqEmOfiF63HrPH/Y9vgChy/Wd6vV7pc5E//hXduxP
	6eELquZydgEwD/Cde2ac4MjBsEvrgKBAXA1i/aHgvGqieX05L/7z7T6DSF9TN9vdcE9tNpzb5xQ
	==
X-Gm-Gg: ASbGnctq9BRccylMDk6Tqky06EaG0M0x2UMk6Xd5iWQPDqj6l6a31yLBAnFh/C7/WG6
	Xnf1mXqtB634NsfqvWfvap7eGxEORqaG2Gi+Zw+emximqaS67vNcXdqcmYNSGQ7H+pnPGKTWHDi
	wr8dh6txKJYynemtoLVywZfy2PlOR4RPKqTD18Xj0mm5S+BflplFavX10Ra11N+iTU9qRSJaTWw
	Eica4ed7Rz9ht9cmm6fK8fF2Oci1mo4AW8RZ2aOLltVeQ3aC46KF0fEdeJrkxNOg7s/V9f9NVFN
	rn55q8K3IoNxHGu3BpWmWl6n0sHMqc1wkvu2BWaKCNW3xbTdz5n2Kokx2s0jdwWZLz4h64niz/E
	1lTrXyk5SsYQNj93H5MBESx4A1iPmlb/1+zeFJbGSUKaxWf4pdbv3mD3Z3w==
X-Received: by 2002:ac8:6f05:0:b0:4db:e906:21d5 with SMTP id d75a77b69052e-4e41c923e5cmr8282191cf.5.1759257651248;
        Tue, 30 Sep 2025 11:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwsnwHhXegfOAmH5Q2PQcQw87oCdZXIED2yyl7D8Os2dUe9ySNO5/fPD6PZtEIL0fG2gQtyw==
X-Received: by 2002:ac8:6f05:0:b0:4db:e906:21d5 with SMTP id d75a77b69052e-4e41c923e5cmr8281791cf.5.1759257650516;
        Tue, 30 Sep 2025 11:40:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58af7e2e38csm425296e87.53.2025.09.30.11.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 11:40:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 21:40:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <l7nl2ujw47rld67b5f3ginqmrs4we6tq4ll2tjjchu4la345ji@6pud7jcem4rb>
References: <f86a00e7-3622-4029-894a-13b575262a36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f86a00e7-3622-4029-894a-13b575262a36@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dc2435 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=ksdtQ14gDiF9pjvKUHoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX2Npfobqp2dGz
 Ms/kIxeMTTXWns5zU/0bGE3/Q+iffG2o3BBsqbpnw+XtI5tzpPtqVAPZp/ISW6HhOxLOrIXBO+K
 lHVXRp8SG8WDKpY/Uq45/eNbqQ0dFkNn5dYlvJqZcJDKlfRcWOxYlkFWrrddy7nyhJX4SOfCI2v
 Nv4ZUa0Yk6XhyKao0NndxaSSdqIG7nS+Sp51wY9nCiMv6PdOHBOVDNJESpw0+M+nNMclUUM/Fog
 qyBiMPVluOTKubg2U3+xTCEXYIK9fGLA3dSKubnCtGBLRenxhQ+meeIxmTg83w0WDRSE1kSHPqD
 Genky6Yy22kcigvcA+fLuhcG836/KTvVgJf1h1HeLgVBbNNCQxJsBtaSc4GRIb1rV81cZqVk3Hf
 0DpYRcpi0nooafr1gIsFJLpnlhoJow==
X-Proofpoint-ORIG-GUID: 5LTb6WynwbStdSPh8VtuVMxVa024a792
X-Proofpoint-GUID: 5LTb6WynwbStdSPh8VtuVMxVa024a792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On Tue, Sep 30, 2025 at 10:58:16PM +0530, Venkata Kota wrote:
> The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:
> 
>   Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300-dspmon-163
> 
> for you to fetch changes up to 456617792f737ca068475cbd6736bf3971b0fa4a:
> 
>   qcom: Update DSP firmware for qcs8300 platform. (2025-09-30 22:54:40
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcs8300 platform.

Nit: please drop the dot from the commit subject. It's not a sentence,
so it's not supposed to end with the full stop.

> 
>  WHENCE                  |   6 +++---
>  qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
>  qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
>  qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
>  4 files changed, 3 insertions(+), 3 deletions(-)

-- 
With best wishes
Dmitry
