Return-Path: <SRS0=i92K=WG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5C8C35FFA
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 11:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A94C8C4CEEA; Wed, 19 Mar 2025 11:53:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B27B8C4CEE9
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B27B8C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lgbB013146
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VfjEq71Epm8bmS+iCe1o62dp
	OmzikYWzE0KYJ2m2eho=; b=eSNjO1D4cI/nCR0Zk9kINF+ipYPpektZWrLtneON
	8oZl9YKShhlOOYB/zkhtXK+sLZuJUs6sV0lb948ExotFGgcOH6ECbRlVHHbGjtgn
	h9N5SYtI1WHiNZCGyCDsshaXY/frQ8C03BjTJyfaYuVWP/AjWUr7uPH1YHW9/+lX
	oyQdP+4bqP4jWA5LOJpYUoiM4DUxHbn4fjZuDyOj2Ym5UarRbkDcZCRLLEwE+BeF
	EuhEe7zsgoVIsUYFqTXVd+Ql59b1RdALhHklEPlOBXuSXWhwZjA8Xyp5m6sgKE5S
	GiKFV1oZehY9UfEstjJJ0Xt7dFBQplQ20Bu+6tmGih9tEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtnaej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:53:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766c80d57eso121735841cf.2
        for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 04:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385181; x=1742989981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfjEq71Epm8bmS+iCe1o62dpOmzikYWzE0KYJ2m2eho=;
        b=k4lW/kczYBNclSo9Hq/Vdksc5dXJ/Q54sfS+0cov+KXnyjZpsPzi/wqcKsl3Pu6MpW
         erS4QScBzmAlkcL0n4s0ly0JqnDm0i6bmwfRKCDfp82vuJHCYBxturCZ+Na9WtloJZMK
         RfZkqE7JvCRWJoKJQi6IG87iAl6MlXI3Vl2EFXl6NTmQLgiGGDUHl99ZPUZ/fhz9RWV+
         MhJc52lgpieRvwVdefDkDIoj59gr9euum7XEMVPlQ7w1CWUkd0Dd0x/DOJFkjlemGMvP
         ezts9tACV7/LlInJsVpYNAkFFQfIeLIgCEd1kG3xjIXJFlje/yp/g0Cq0uCqmNnCqXu6
         OZow==
X-Gm-Message-State: AOJu0YxqpkC1oTMrGT64kbAL3zpibI7YSyHfEuZmMmaSJMhQGlPvjGjT
	2QZtU1OY2jFGhxBE9Y7lFLtzDRfXb5ZRySDAzFO1mQCnp+BA1HXadFG1HluR6HdTWFO1DGVZyul
	LiDxa8jykRjrx18wMZxyVZIc5v3xsV6lFEwJM4rii5s3ykHMT0vyPO2h2UzA=
X-Gm-Gg: ASbGnctSLPKm/RDCep3RLxjyzCcAaYYKR1YlbK2XwcFjmdrHTd0tMAV/JzwsFpUYZtD
	LwCH3BTrYGyDmH9I8gbpAKRNADfDYws8tEyHDYkOG5mXMayMT3CrpW8qgl0t4PfyQco8w7gu2+w
	JF/rQ0SICCrU0aD0e0pQd8tgIabHbwlaxyHwUbSOPWvcULsWW0Y5ObafdYk2tYWOgWofTdREpdJ
	hMojTB48cYyUPkc5Vwu/i2AxjG9GSyeMernXFYJSnsV/pDJbXouPtieffNm94ksuCt0yhjGxGkI
	Cvaf39lp98psO2S4Px5KKS8+KjY8p4wve/05vLMRLmF3LuCA4LpTJNqOVlDXttkMmVSbD+OcEgo
	h4es=
X-Received: by 2002:a05:622a:1c14:b0:476:9193:ce5f with SMTP id d75a77b69052e-4770836aa7bmr46550171cf.38.1742385181607;
        Wed, 19 Mar 2025 04:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvkPVxOpIoOJOi4VLwaUKNR6KbM0L3uUsHdwPxpwz1ei5xZT75scqXc223zbF1YQaABWnInw==
X-Received: by 2002:a05:622a:1c14:b0:476:9193:ce5f with SMTP id d75a77b69052e-4770836aa7bmr46549921cf.38.1742385181259;
        Wed, 19 Mar 2025 04:53:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1daa4fsm21901611fa.101.2025.03.19.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:53:00 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:52:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekangupt@qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Add DSP firmware for Qualcomm QCS8300 platform
Message-ID: <qf52acj3rhmztyhtmvxejzzz263bznwvvbs7dqm4yytw3mduif@yl4ocbykomb6>
References: <20250319114242.7192EAE2@hu-devc-hyd-u22-c.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319114242.7192EAE2@hu-devc-hyd-u22-c.qualcomm.com>
X-Proofpoint-GUID: ExWkSuPD_1hjAN2Dzov4b-ITcYOhKkMr
X-Proofpoint-ORIG-GUID: ExWkSuPD_1hjAN2Dzov4b-ITcYOhKkMr
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dab01e cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=nZ1NwC8qVhZlSVHIok0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=900
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190082

On Wed, Mar 19, 2025 at 05:12:42PM +0530, Ekansh Gupta wrote:
> The following changes since commit 0c5a986c6bd6b8cf382379c4f9c844867251bafa:
> 
>   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48 +0530)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git 
> 
> for you to fetch changes up to 0c5a986c6bd6b8cf382379c4f9c844867251bafa:

No, they are not. Please review your messages before sending or open a
merge request at gitlab.

> 
>   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48 +0530)
> 
> ----------------------------------------------------------------

-- 
With best wishes
Dmitry
