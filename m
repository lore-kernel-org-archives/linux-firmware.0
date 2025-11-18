Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCDDCED26E
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 10:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE918C16AAE; Tue, 18 Nov 2025 10:56:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12855C4CEF1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12855C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rLU52664745
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8bGUIZ6AAT+ufr7H0QqVM+8K
	Gn1azBb1bZ8kv9tvQVs=; b=YkG3AwIWn+b50C5kZ0uuz0pEXna00w7gGWRHwYvN
	HmDTPXE3p24DoCAB5LSbXzJFdNchYQWqlVuC5JwHTV9PnyN1j4Hrnv0zKEvb+DHS
	UueaoWQhFYkz9d63v0s8aGj/RZjKYuwviW/ehRFjpDMVhqyZKBaf62/XZXvkb/2w
	qfzXIWniSx8EerVd8VYMfQ65J42X3EPxMsiT9amk7Squ3JKxzjedI6jKkbPBEEE3
	VHdLZNmvgutJA1nVfqfqVRLT6tx8ywHXOXnAimRix6vlvXcIrjfrNTHL9qcnabiR
	Rp5MMs139tQs1CXgUpHhzlZrbrubCRI0JpSmy9uCL95R7w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk85u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:55:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so159066801cf.1
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763463357; x=1764068157; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8bGUIZ6AAT+ufr7H0QqVM+8KGn1azBb1bZ8kv9tvQVs=;
        b=YEHdm/V/IM0ux5jmU0sDzyBNnCOP+TCUNsq2EEIx1voL3epDTvtSURNlYeF9/nUzeQ
         9IPb7qOzjch1pozzf8QMRHclJYD9pJuYCW2zKa7xhf2TiBo18SDkCtv4RUGGH2zVZM9e
         rC0Fn8d/ISfuO+pPdm3uCEhu/KVoMtZxLQgK4s06KiumliM6hTo2jxdBUJfN3kRAVPMG
         ZLFMsXgLneQVaaB4UZr1gnXxggBv9lh9AiWlBsy3EaKMsimNFX1kPh7nZsOXBdqLUMH5
         uK+GCaZsPbke5vu7qGdafF2tcf9GDv2Svo+oSqdrYzjv8FpI3QAY71ASH+su+f2xvsa5
         M60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463357; x=1764068157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bGUIZ6AAT+ufr7H0QqVM+8KGn1azBb1bZ8kv9tvQVs=;
        b=fQezPt41lf8uV0OKanWfG8OTTSEibN0qcPuc8hT2fDdMYMLybphi4dcBIzImzuSIp7
         dqKcQJlCh7EkGd3kneBofo5BTf4MWur4RaVmfg4/wnMXj9wpNSGETTFZUD6M8QoCARcF
         wgS5XI8GES+MueaLmJFatMHrWGdCq8U8vgFnz2MYUS2OacROe/s+Z07HNE0iQGpUIgrz
         wRcBEqEzkFZI15eBQd9B6T4R4QHolhyp3KlrEI2vfkBI74Ca5n4dY8xYPkzA2UWSjRgZ
         KgVxZm2HsgZpiLEL4jVWqIM8uLcDNa5p/YrvbyfOuYww3BJaj3NGhBeRHG0JXVXNvnfv
         Gg0A==
X-Gm-Message-State: AOJu0YyQsjXA9WtQJdkPeoYbzL5BigiC2QGFBjwSzhZfL5Ygv2LGtP9t
	vw/o8F6r2T8ckwma/cn7gum9Ew9DBK7hA7LdprAZvzqvtvRnNTlDDw22/Z4vher/rC3GxpC13kI
	nk3DKQ65HWjXbWo2ojr/sy3mDSxxcwOlGQ3ibKWOdtGUnjpF9FJE5YUTieaRT4wk=
X-Gm-Gg: ASbGncvb5DlkHfCoRP++vphsRiE2WEr3jhh5cBE5JeZP86MCHrON0PcTb2o7Ry++kGq
	/LT9EAWYIgWPGq/rUc5bIXWL1PnAON+3KwnbiOtd4YW8iGn4Czs1pKAL6LkCCtegi1OFGSCiq0D
	aNDM10kxZWC/4Ke6hEGXDrp/VxSIdQPT7NdprdyZfq1nfyHNSOTIqlyA+raROBKyVAlB+2l/JrS
	zanam12z/ywgY28RNAXsM9yiL+DsDyLv6mHxQgaWXuFbJfPWmuxK0NJHt2jfbUylaVJBw3zA39p
	IyE1YTwoOJ+jeruwYqYj5E+oby7ciP0fqSfgIFjzqdYH3MMZdEw+OC7U5xbJNMdwyNOA874ke1a
	bu69ASu8KJQazoxcw1QqF9yIPGAp4m3kKHCpg8PtEAwZ9yeLSWhMcrUYT02NIdSSkZ7zCdEt30C
	tux4uSGoBouODg
X-Received: by 2002:a05:622a:c7:b0:4d2:f9e3:c12d with SMTP id d75a77b69052e-4edf203d3b1mr207533991cf.14.1763463357607;
        Tue, 18 Nov 2025 02:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKWFxC6lWVg0QDabmIxwVdWDZVT2Duqp6WZv7s6RZ1OY4iZK1e1rIKYQH1DLanRRUqKT+GPg==
X-Received: by 2002:a05:622a:c7:b0:4d2:f9e3:c12d with SMTP id d75a77b69052e-4edf203d3b1mr207533781cf.14.1763463357094;
        Tue, 18 Nov 2025 02:55:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8bc7sm3798002e87.46.2025.11.18.02.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:55:56 -0800 (PST)
Date: Tue, 18 Nov 2025 12:55:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform
Message-ID: <fcdw5rt5ekksevzzz3powq7tzdaosflg3wll2dmr2zcghj2fnk@fyzdimv3u6tq>
References: <8232a96b-7b83-4c12-8ebb-d2ddb37a3fa4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8232a96b-7b83-4c12-8ebb-d2ddb37a3fa4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ky7B6_1zx5ohVYcdufUwhj1cgTVWvKXi
X-Proofpoint-GUID: Ky7B6_1zx5ohVYcdufUwhj1cgTVWvKXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4NyBTYWx0ZWRfX44BOoXQ99iw+
 5EEqOa2Uz++DS4L0pKUpNk0idRUiOY47beDeMNxK7T4ZJCb1Gv5ojMTVZRC+1gU558MdLg+Rfir
 9eAeglXWEhoM57utn2zNMzLYq3vbLBEXsq5CbRIKiN2pibvOJA06Ir2EIiQrHD6weUWex8rc5JK
 EyOiaAcbCcDLGMIe2RcwqHpAQjWIaKETb2+GNdYfCNCYi05Q3f1YBlG64p8e4Lhq0F8YM4RkG8S
 Qc8+TG5WzASBu7QBZh25/A+R0lTLSziq6Bjg6n3i9MwH0MZ9Bvcx7KvSqgINy8Kdu0YnJerawG9
 8s+gIqBTMQlkFOevcwa1UFhoi3xfm+D0CO1mUDk0kfjM95N4BjEAa37DVXZGtWwYQ89KZKmB0aJ
 YdfH/EYPUs2ekAHudbEARHfTM43V5g==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c50be cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=_vd73KmtHBvxkLtaXLUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180087

On Tue, Nov 18, 2025 at 02:18:56PM +0530, Venkata Kota wrote:
> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
> 
>   Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-pakala
> 
> for you to fetch changes up to de779eb0ffa254343e2acce6b9efc5bb304f73f6:
> 
>   qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform (2025-11-18
> 14:12:51 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add ADSP, CDSP Firmware for Qualcomm SM8750 platform

You didn't run a 'make check' over this release. Why?

Also, should these firmware files be covered by LICENSE.qcom or
LICENSE.qcom-2?

> 
>  WHENCE                   |  11 +++++++++++
>  qcom/sm8750/adsp.mbn     | Bin 0 -> 19421576 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 0 -> 180024 bytes
>  qcom/sm8750/adspr.jsn    |  22 ++++++++++++++++++++++
>  qcom/sm8750/adsps.jsn    |  22 ++++++++++++++++++++++
>  qcom/sm8750/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>  qcom/sm8750/adspuo.jsn   |  22 ++++++++++++++++++++++
>  qcom/sm8750/cdsp.mbn     | Bin 0 -> 3912104 bytes
>  qcom/sm8750/cdsp_dtb.mbn | Bin 0 -> 36664 bytes
>  qcom/sm8750/cdspr.jsn    |  22 ++++++++++++++++++++++
>  10 files changed, 128 insertions(+)
>  create mode 100644 qcom/sm8750/adsp.mbn
>  create mode 100644 qcom/sm8750/adsp_dtb.mbn
>  create mode 100644 qcom/sm8750/adspr.jsn
>  create mode 100644 qcom/sm8750/adsps.jsn
>  create mode 100644 qcom/sm8750/adspua.jsn
>  create mode 100644 qcom/sm8750/adspuo.jsn
>  create mode 100644 qcom/sm8750/cdsp.mbn
>  create mode 100644 qcom/sm8750/cdsp_dtb.mbn
>  create mode 100644 qcom/sm8750/cdspr.jsn

-- 
With best wishes
Dmitry
