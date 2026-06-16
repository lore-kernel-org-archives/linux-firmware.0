Return-Path: <SRS0=xkyK=EM=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3564FCD98CF
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Jun 2026 10:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CE281F000E9; Tue, 16 Jun 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781604027;
	b=vra27qb8cm7U+8w1GiB+5htN6LGS92uJuf8+fCi4+ODfj/cLQqznXrbFe3mG5qsJWGyd
	 oz6wJEnwlj55khBKZJCmHsjShHUx8zuMOufo6ce5JpBspsgMrCDLxCOY8V1RYStxsJXnO
	 4D80shtsBiY8lZqkD4uFiFkjgr4hW9+rJzm0C+Z4eBTPAai6ZT0c+n0LQhys1i9N4np3m
	 3SDAJAzogC92q0Q0C0pauWydXfBmA6i8bpuw53R7PB2zYvlr2ddDgTXmAS5AZRgK449cn
	 hhzNA8jqQOJB/32fp3bIfVPgjkE+xobjkOP9/T2B8Eb/3q7ujMIVeY74U1z0vcV4f7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781604027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oMwsy7iW92YusAgVuimtYHs4kcYRF8hCu54oetm4ySk=;
	b=rmS288nyW2wWjwVb6q8yVfXOdgz6mYvQfkDWVpGR1P9pO/71WC3F0z5uc0HzFs+Rdbwe
	 4ylysd7UQOAMW9eeNjMfMF+mjQlPFlwBrwtaixHTCfNfpPpOZgHuIhsK0xLevG7k/qgzU
	 17jG7CDn8+BywenF4vjdOJ1/5Y5qLbqHUVK+8lqmRElOje/aR06mZol5EpIV10Z/4qBQ9
	 stPGHFguYTB0LkUGeXQ+nbVn3/zulhsR6158whDmM6mZv2oJeXjuAWWO+FFAmuvOMR2yE
	 KqD7t1y+I6tc/sMA9dkECY1VaeCMAoD46n82Nb+J5iCrgZSNK3ZuZzkMyetUKkZL1zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDEIS0QN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdeTfZst;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B9941F00A3D
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDEIS0QN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bdeTfZst
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5B9941F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G66hY52893888
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 10:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oMwsy7iW92YusAgVuimtYHs4
	kcYRF8hCu54oetm4ySk=; b=mDEIS0QNQXFTmk08aMsU8PeiPEns9ro5zQi+K8Dz
	cJXouCdtirWYo99MOBGVNsuJLtNrILFmBE86CUVa/+e11C95mgrr6lCCvMn+1IT9
	FAj/tjVUol3zXCXZeALPKkdwnuVoDZyGeW97xOjOdDQK1HF4ImEMQNuSY82YrVyP
	WqYrjw0flztsAhQgWTyLMs5tHvJbPoy+bT2mIs8dZlzRFNDUcvJ72lcx/+AVnEtw
	nIW2EYr6wXjJu9kWUKh7786xAA66tWbxCq388CoYKRKk1kfw0FmiSNI8ANexAKDn
	IEyEPS3IwbgCUJMknJslXlRLgXm7fmsqwLUZMw9r4u2Qqw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhnmj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 10:00:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cea4854fe3so99542116d6.1
        for <linux-firmware@kernel.org>; Tue, 16 Jun 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604024; x=1782208824; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMwsy7iW92YusAgVuimtYHs4kcYRF8hCu54oetm4ySk=;
        b=bdeTfZst1dFrZVm6pa3nwX5HAfNFQp62ZBu+2OCVoFdyfiuR8JsmmCXERcFLFofRlx
         FNHSLmhz4Jmv77b/ib0VumRwpF1Pjta7+9NrhdNMV98Y1W6x4KA500AZjojQwOYwjQI0
         vea2dZ1sTe5U7diTUNnpeIUHDu09+7B2qKQczlGgQ7J+isiWe9GyNpREypjIavl/Y9km
         dh/zLtsgaC8e9FhzvT3Nr3mW/3oBaSytT3rfJSmrQ0vulxbNXJHuMt7CcRMYkrJwafGd
         aCwj77mzkbL/47cK5wcv2VwWJylN8uwSqPQe5BxBhcPIp/Rua82+R6hsnksP+87Kv2+x
         jCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604024; x=1782208824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMwsy7iW92YusAgVuimtYHs4kcYRF8hCu54oetm4ySk=;
        b=k7S7A16S+Jj9ZRDvvNEaspYS9qj6aXx5xIDROROxQvEdLd3WhsKuCPjzV+vBGfvot9
         6hAUp5zKITlCbcamO9nk9TKz23wq9ei144NSmZB6tXCvlWc9Wic2i5D5ifGnWNRbQ6Id
         ds7jsUb85c8Pe+UsMCgLJlwfvZ0642PkDCTg+FQqoicMqGJAFCgGJ+wu1c+pJ39SSaDZ
         +MGqhDKAhzrmcihe5iPy83v3Nv4LOZHGE+s5z5ASRXJ4kz2PiuZ/LcNwgWUkOdbTtdxD
         56UL6WGWB/pcQILg5B7uCEMrycBxsT2jTh8y/JmKmnFo+8umL6NN5eZJjo4+52/OSVPq
         98hQ==
X-Gm-Message-State: AOJu0YzXDAu57DSh9ERdGLGNpRf8rpLqaQBYB7zIZAB6+Rqz+V09Lhx2
	5y+0fmA4fKlwUHowJ+uj5yTV4Mq+tf9GgVnXdBC2FnsJfh7bg9786IL4uMkzq31gKb1g7WOTZx1
	zqUFRVmwAicrNX9tnb7TyqibRwiYY7LIsemZi7u1pwIOdSQBwKbX3r87AYH+7edYCJthSS8A=
X-Gm-Gg: Acq92OHDC33XN0mjduBigy6hlWl8sdnJkbbIAvW0fUs/MNOxxYmBXdWbs8F64x/2ist
	OQvsQe9sJge9BlC5FM+IjB2pRXUCdE2n5Ge84Q4h6tmNksPwR5sjVqZ3IByOf03wgCoZBABlg4z
	rO3Org0kTZ+xzGKVlhnoz9t2HS1sjbBcza9aqK1sUQMo08vpOKihwnbZpSZ/MtvLZMtJfwkCo4v
	YA092Q5nEhqkFBvzDgPNPrd3WTiPjNTt8CSxx3KN87EiMqwjinHVraBIYeq4YWPnNqa5EG1282s
	t9C4FfzD7a/gFio61jvazUyC8sHsVhAxAXzpy0VzcjVBvwJdG8HroJKlfBesSU3Ssxoe6xvOOxT
	j4h1XIL+FZdjb44cEXWBdZ7IPxO3K7LWgJBK+TZrG5opZYEMvluSiFoCIFJ+cyhUuG0R6DuWF+a
	Dl30CB7ejbBiCK+ZVlifAEmOd1BTpHKgkn+uQ=
X-Received: by 2002:a05:620a:19a5:b0:8ee:bae8:2bb8 with SMTP id af79cd13be357-91c47794e7bmr407018685a.36.1781604022298;
        Tue, 16 Jun 2026 03:00:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a5:b0:8ee:bae8:2bb8 with SMTP id af79cd13be357-91c47794e7bmr406976485a.36.1781604020108;
        Tue, 16 Jun 2026 03:00:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b49aasm3369467e87.77.2026.06.16.03.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:00:18 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:00:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for qcs615 platform
Message-ID: <aywaukdwo6qunzwdyknjb3ocke7rtjv3lcgzsledt3bqayvrcx@7xrlai7qeqvf>
References: <ea1d1eb6-4a4e-43e9-87db-917e0b94433b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea1d1eb6-4a4e-43e9-87db-917e0b94433b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfX2TsT4P4tlR7s
 Soq2tU2USDjiPxxUaMPHB56nIdlRrVBSQYJzTwPokwxCnUHHVcWc9UxAodHzCT74tZDC53NGJpU
 t0QMK6Ls64kIqIxeO6urFlP6jtAlloQ=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a311eb9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=EwnU_-auADrnrq3yS0wA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 50-DDUUTGPX_3Ptlmm_oBB4KMH0r5R-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfX3CDmL96eiiYb
 Mu8by/vd0uL0kSIHXLjpPnYK34tQoTpkFYnnKL1kmJV1fU6/o/IknbUWKk1GimODKFdIWqDK25S
 zcuMeJ7lYD1NRRePINe5OEm4ItKlQaCYz1zQB89K1+Pw+PqoYDNolzClpP0qBmvvclREaQmbqrW
 eExPkZMASO63iMGFwobICt9v6eR6thYViHlyKKcp4Xjp7ZngYtwUG6jCMQK4oP5mlWxub48QmtY
 36/XrxrwLdMPgieNfCHumTLpm7ua8Ib8SPF9EqZMtnp8EXX+sZtDN1fH/pkHNE/+u9zAIV23Jjq
 lHVXWhxU/t2KN6jPi1R+sJoe9G+nLrG+yCdfYRWMic36qnf1tP+GAmRzSwmF1pxG1c7wknFZmRO
 3DFmrvFItoz6y6lWPDVahFHh7tGM0YXPwBdA1RXar2vtjTCGoaWNXOrl9QpEVJqG4uNCDeeqcb5
 25E9ebH5drqSdQIoYGw==
X-Proofpoint-ORIG-GUID: 50-DDUUTGPX_3Ptlmm_oBB4KMH0r5R-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160100

On Tue, Jun 16, 2026 at 12:01:10PM +0530, Venkata Kota wrote:
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> 
>   Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-talos
> 
> for you to fetch changes up to 8db1d808f968e7bf3810667095fa36d8f2766d81:
> 
>   qcom: update ADSP firmware for qcs615 platform (2026-06-16 11:48:24 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1105

-- 
With best wishes
Dmitry
