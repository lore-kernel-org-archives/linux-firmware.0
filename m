Return-Path: <SRS0=F1LP=BF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ACAEEF33D
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 09:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43016C19425; Thu,  5 Mar 2026 09:14:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69F17C116C6
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 09:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69F17C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258tYvj3160347
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 09:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D8g15c7Fisd3LaZDRna7s4g+
	kBxG/gzCcXh2CVGFtEE=; b=ef8DouFOGi3FFSWXJGgh+1P/98QpKlhxRBCnGzkM
	vGS2TLhEwc3d6EFGzc6bYAjaPSkwX/XdUpCR32EgXQAgR5351ur0UeFpIF834l9P
	Q8MgS6K51HFzGGRaIIN5bbIw0zCEYZR/S7nmApQcJGG0bq99lbgdeeG5SV7xbY1M
	AJyY0d2sySz6T+UBSf8gRYeCKIXJPJdX7Z9dKXl2eoZL5r8zeeMxlB6OETmZ/j/9
	KOdrVQuGxpimYAwDVG22ue7t9M0a7Dg+4BiPvQdyoA75MAsBDJf8TqOe5iIOIO4q
	F7koLGsM06Rnh2X2ncNEdh65Ap+30yKUV96RGCOd1gvRCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5v09r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 09:14:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cbb8040f48so5198408985a.0
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702064; x=1773306864; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8g15c7Fisd3LaZDRna7s4g+kBxG/gzCcXh2CVGFtEE=;
        b=CbUdW33udm66aToo4uNrPggbUnCjQc523djlXYy8OAMLTdvtxiWEXmiG7HshpFcWsO
         oR3jAEvE36POIAQdWpyqL+ip9DsxVmkF5g3nme6vkMdGr2WlBPt4O6IZrgp+OjNlkkmn
         +DGZ9lw9/8KNODcgJuvEme8HD7lIk182yc5y7IzIkIWBbwryMkgmX+UfOM2K+jsxY8Fg
         l+XkYMA6aSjdaFvMXdVwNhIe+OPoVAW+TdIRh2b323Uy/AsPDXHZZfhiQT7f3Ct4P0V8
         o5wpYoJtALtfoLqpE/EUMkPVZAlnJkvE5LQYvVjkHJIZZGuApZ/IV5J+y0Rk+SvT5REL
         hgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702064; x=1773306864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8g15c7Fisd3LaZDRna7s4g+kBxG/gzCcXh2CVGFtEE=;
        b=t8m7FtwO/So8BpKtk5VcZ/m01qHdi2G7X7ozKVw3rKOuUUojj3SF4BEm0wOaP6+KPb
         i0zplCiY1r3dU77Smi4x05o9b/RFAwRp8IE53QEOWBM9GodNsHKg9K+K4KWvacoClv2Z
         qV5coo+/1BHTSkwMmrzf+3i1xabi+TOvs32uKc7Z86H07CNwINYrGco+TkfuF5n4jrrt
         oPNlXw4u0fer6wAKifYooD44OfjkgeI0ihh2H1PxfCh1DmHB4RnqLSStOVYF1yXqGTwP
         ODjm27Pfz7HiHwHzHzaQ4wKsxlnb1QtL5dDbo8cg7U75bL93vWANmg6OpPBmQyuIAQ7r
         UP4g==
X-Gm-Message-State: AOJu0YxZL7aQdx2Jt2v/SVhjgH8VG4emkz4x6t6OZ5D0HhZJppq8Y/g8
	ipkrPahrWkiTR9hvfMhanj/gKNsRBDu7lNmAWUVC8nwChtwcGO8A2WkF6ThXqnrQFsHPLKKvw0j
	8NRRx6saCVwFIPdSOXBRElkuhsA9iUdfkxixwA9fjvh9+OrBaa8vwKxFp8tPYpAI=
X-Gm-Gg: ATEYQzwgjo8u3Vr1G2g5WKYkR+BYUHcKjsQycuJKj6qOxE7QZTQAalYsVbRo9y5CSxL
	Zsmh/kFrK+CC5uDWig6C85csT/hWpcEqI5aczvly+dU60c44fc2yEXGQNYdwBEgyPExQNaSZGpE
	i2w8xcjGVEgbxgB0NvroKkEFzrjoUYLxu7cxhlfouGirbZVc+UmkpGlRhTtifta8/7knyJgkADb
	xikFOqVdrzXVuvu7q8IAbaZVsUhJKGU/p37pEJJeFd75qofJVED4ta6cyXQE95z/Se+Hp0JHZiJ
	0wMhjaPzWcWQimBiQCfjDL3lcqmKIqCV4MEUjyX6e5PuQd1G/FMJMEWA5CvLjb1Q7hhCDt1jojC
	5L+PqUnrbBavibNo93EHrg2EhioQuHVCDOXIQ5z0YWdS1jYEFnutBjiqiIy4C05fRBMaAhZFG1q
	4rKWWYZJPej+y8ypfj1bemubF5lFhp8i52xEA=
X-Received: by 2002:a05:620a:4495:b0:8c7:fdc:e877 with SMTP id af79cd13be357-8cd5af96383mr625428985a.41.1772702064602;
        Thu, 05 Mar 2026 01:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8c7:fdc:e877 with SMTP id af79cd13be357-8cd5af96383mr625426685a.41.1772702064169;
        Thu, 05 Mar 2026 01:14:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b356sm40015441fa.2.2026.03.05.01.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:14:23 -0800 (PST)
Date: Thu, 5 Mar 2026 11:14:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: add ADSP, CDSP notice files for sm8750 platform
Message-ID: <sjlerimbkmclb6tmax4jfy7edq73nllotla6oheebiny35jqeg@ungsnspduk5b>
References: <15774628-953a-49c0-8a21-543524cbf643@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15774628-953a-49c0-8a21-543524cbf643@oss.qualcomm.com>
X-Proofpoint-GUID: VFnC64QwbHv2Nhr5_d7BCNeGXqbCfftk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX2IjvCKADcn3O
 N4pI3BwZEAT7yR/SLVNdwBCRrXsNWc/GBJqASFhuMNmWrS+s78j3G1DC4OtoXdy7VNEvbF4wh3b
 Dt80y9JATTZ7QXHgUFlwnuAbizqyylY4rkM+ftixqh8cZBtsO8vBAha6KGxBewwrok52d178zrL
 aMQbkzFpMmVHTF9zTk8o98dDvOmVpizte+JuhwcYCPpQENmg3Gy56UcGeZxe3jQ6+ulU2H+bjGd
 eFRFb0R2h2+p9Exdu2gwlq63C5O8tyy8LDIVguFWXFRgZcZExxQFmRH8RLHJmMM3uTIl10j6VXj
 lX2jI2COpHf+Y7DuD5hqaYuyfx5erMsIdh2866eFDlpA1lhBgFRHbBXMAz/0sLsOsBmNJlHRvUq
 ERpospz9PwSYPNEGNia4/bgq8tHXs/tEF1QXCV7QJoR+6cYOJTr6JfQxdl48pOH+XFxdjMhAesm
 +aKmvfiv+EygQZ0WudA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a94971 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=PMQqF-G6z6bPXGQ0gOwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: VFnC64QwbHv2Nhr5_d7BCNeGXqbCfftk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073

On Thu, Mar 05, 2026 at 11:48:16AM +0530, Saddam Patan wrote:
> The following changes since commit f69a5e73c0c0c927a5bea53ce707ef17afae1964:
> 
>   Merge branch 'audioreach-tplg' into 'main' (2026-03-03 19:46:20 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-pakalanotice
> 
> for you to fetch changes up to aa05d14567ea5de6790a4ae199b4ab2ab1025fb4:
> 
>   qcom: add ADSP, CDSP notice files for sm8750 platform (2026-03-05 11:46:08
> +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: add ADSP, CDSP notice files for sm8750 platform

It's impossible to comment such a pull request, so could you please
send this next time as a patch rather than a pull request?

Also please check the comments that I've left for the DSP binaries PR,
and apply the relevant ones.

> 
>  WHENCE                      |    2 +
>  qcom/sm8750/Notice_adsp.txt | 3214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  qcom/sm8750/Notice_cdsp.txt | 1270 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Are you saying that DSP binaries and DSP firmware have exactly the same
set of 3rd party software in them? That's very, very suspicious.

>  3 files changed, 4486 insertions(+)
>  create mode 100644 qcom/sm8750/Notice_adsp.txt
>  create mode 100644 qcom/sm8750/Notice_cdsp.txt

-- 
With best wishes
Dmitry
