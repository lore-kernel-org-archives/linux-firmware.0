Return-Path: <SRS0=4qBf=HV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A59CA5FA1
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 08:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04DF41F00893; Tue, 29 Sep 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790669911;
	b=Vuum1I7ItH5dvatJd+tcZGFOO5SLStxHd6nV3j2CcpSWbvi0b0X9XuMBlm8j+RvTthu1
	 louAV13LTNAJTokoPza6Lk2C5GuEqROg5yxL3v6TubBsDcn7NTe76wTg5LjyafB3xdQaf
	 LIfrl693z8uzXJvF1n4xp7VZ7UQrbHKVOKB2RXMenTtohgje3lhla/Nv8qbkdtwRN16Cv
	 LrV6CCzEa/bTZ52qTDKZCPipLd0kPRf0Kbr//hdLHBnK+IDHhHWsONEaV9S1I+jyfVTfX
	 5bsOYMCKDSGIzkq1J7JlEtClK9oZs+aITylSPB4GnmZVfb6k3SX9I3RhJWMGPAFmAZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790669911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiWZZrLUGU6IQI7HjZXk3roxh3mbUcCmZeN9g+PmzPQ=;
	b=Kcu+0Fcu6Z5nQeWX/v24v5UcXo/MxkdSAqFw/nnbrf02srwM45O0nuMkaF/sGC7EAYRf
	 /nZ+QN9VcV2OhL96kj9sl4Tkw9/uWT6jQWfUeQ9Qs7dG/bWLJKzkF6RJQbhar9YU4rw/V
	 SkLUPYDGwvUItf5uYc/7qoIJHXfc55WJMNVn2fLURYp9GvTSuAxp+gkdAbbSD9aMqJ0dK
	 cBoAQ/gpxZ38suacJgiiqGffN+NYy6MnNQxQX9wOWd6TPQUfdcyauVR53jcimhsiwFvHs
	 9veJ3rOaef6hUxLSp2bIdA3hJkxWdzrcFXdZIvnNpzdot7XYRAYDMNatDhXmeG2JKxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gvhULcZK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Fjuh9c2/";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 632B81F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gvhULcZK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fjuh9c2/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 632B81F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1mQ4087184
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZiWZZrLUGU6IQI7HjZXk3rox
	h3mbUcCmZeN9g+PmzPQ=; b=gvhULcZKWZH8voIFqDauYdSd4F2Uk1Cvydb9bDVO
	IA6ruRh5TNzocqdzL/rhaJXEU+7wnmDLqYV03PBUJE7JvejB/JOHuffKpk2kgF+V
	RQeaJAObYtnNLgZ/sONruAFzEMA9ip9SJg2k/dLdPQAWB8YsvqzkW4Enea9KxbOF
	KQ7Msyl8H8llhnliO0knt3rhQQYgpigIPm2DnYVdxUUrqCSjtkRtct4J24+8xbXP
	vawMS7NHOF//5rPAsliW1/ve7+E70D6NaPc04uhPEucfWMkVfQLcF51ThwotLlRh
	W7z/0igxq2gr4ciKzT5LWGbis1iEy8xdlURN1cROs9P9ww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4t0j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:18:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5e9c2ec1so120043485a.0
        for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790669909; x=1791274709; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZiWZZrLUGU6IQI7HjZXk3roxh3mbUcCmZeN9g+PmzPQ=;
        b=Fjuh9c2/juwugh8QG6fwSsXQX6M6gzW8u32VsPFCuhSTC/ReDgr1tqHYdEQetSvL7k
         KWm9IejA0nQJJqw50LDv/wBS2cVwc3KwywkPFf8Yp5qlDf+RJidH8h2Bp+jKqV4e8fj+
         LJWqXwY5+r6sFCL99LeSK7OEYGyCEaAd7R3z26v4Pg0HkqkqRBuDHlQU0X63h53akjDo
         aC/hwcbZ8U4IYuxqpAKVnm/O3y/BEBMGSzqaMn6+g2QU655J3I0YRZy7OSHFIyL6nT5M
         YMqmzKYEzeWoY7MvobhlIphu4VGajK1RbGtQx0BKpuxIBi4MFzRH6zbGpjTbH3vW5vrS
         3Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669909; x=1791274709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiWZZrLUGU6IQI7HjZXk3roxh3mbUcCmZeN9g+PmzPQ=;
        b=Qu0Q7G152/hX+wkBVj3mZfzvEIwNuDs3eecxdD2MGy+ocnwIGlY97eFR17R+1q6oOf
         Xa09vkMIHOTJymiRVnw8uE4iBQnyCMss99MoHv+UjGSxZ54F7pfLGFj3JLIzx0RsBw8F
         MjMrzJBAFJhgi/dMPJlkieOsUxS6dOTXo3SCY2z59tWTWfO3KyB5Y5v5hrKbb6fhx+HD
         xuB7iQ/R7Cj3AmvyxMzeWClL1tGEyAOCsj23fD/DXhmUhDon31z6DxwmCjJYxE3OQK3j
         4GPq1XZCP+CWzQqfbN0PzFnyU3bCcJJzKGpsHTmwfIpiDsN+pHIsqXwHlnRkgDkecLKo
         YoTA==
X-Gm-Message-State: AFuF++nRrBMRxFNrxfIxl7YIPQm9wQY4OUw46lYVU38o5o6Capz5RS5t
	pgroGoL74vOHK8v2Yjb/o7/aWqrlJDdSwX1W94i3cuSpz1K6TlRLLRO4fmqTC/0y74wUElY8uOF
	1n5f+XhP9UbU6ytYxnzneV+H9EoZOQriAIYcGwRYkO5jpzQwVGI4M1vF67/klsJU=
X-Gm-Gg: AYBFou0TNUyah2uKAjmVXiMeplUvXP3fGNW0VAzPkSnNF4RpVH+2FTB76BotyIJtYIW
	E0oRxjIns/4QYoy4SxJ6dzmTQecpg3+Mg0FNUD/lUx5RXUB4h51MghoTRHNRruBYeqSRwfSYnBi
	7GKI9dD6HPRGfr96sDeQxRRI+Y/7oTXeBdH6YHawDCYG9yM4hmJqWM9k/TaRe9OUllbfBFvYVDF
	K/+nd8SnxshV9AmJu2X0j9FSw45KegPJp0VLDzCKvJgrNyKGH+OFMDKuJkbORTaMN/HjV61z1A6
	3ERRJBbkJL06cSyY44G7G3ZVSjgGnDek+e/0751F9dTB3Be1zEFtj8aH5RF5Gw/i3hj7eyAwcra
	PdedbsUMDzx7QObwEM4u1TzrloS0Id1ZGXDeyWwUIjtb6VN+4XZ57U0Td+EM2oTsuMj7h4WEsuG
	Wsn2uVVTdBV9u4
X-Received: by 2002:a05:620a:8394:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c8be722fdmr328108785a.8.1790669909369;
        Tue, 29 Sep 2026 01:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93c8be722fdmr328107185a.8.1790669908907;
        Tue, 29 Sep 2026 01:18:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb955asm1172511e87.53.2026.09.29.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:18:27 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:18:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for hawi platform
Message-ID: <43u7qxt6pvl7ohu7fqgqoqrf3ywqlp76tcavoprcmwxzu6c7u4@v2dorenloh4e>
References: <5a6164e1-a66b-4b39-aa59-9c2c5fb824d1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a6164e1-a66b-4b39-aa59-9c2c5fb824d1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfXwtuwB+/ZyMJO
 6pWgQyFfbyZ3Wyyelc9mGH8TbXOA6m6/c+UNV64ll5iTWLT/907r/IRv9W6QQC5OVrKrs73RryM
 8x0H0ou/iC61oatGjFzcb28Am1D3uks=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb7456 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=odia8E9z6z6nx5WF4dQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfXy4WhV0AmDF7y
 iXt4d7xqjxjpo3p2L+Fzrs9U8oyJ/bPWV9a/OK6csfc4DeXabsggJmrh7y5hVsuQ7/8Wtn6j+wh
 Va1KxG0vhOJHUx/xYqiKUhST3wTyA2DxRXuNJ79+xHeEGUVDH6y4YXBLCPfCgjLuTOZu5fA5dWa
 nf6JPy4NElg6XoVQy9/ed4JSKxI0qnjTLZ95hi/aNpAKDrnMusO0UnOayYZTX7AFX9Bdez7ACIv
 FTe/m9ZRa/Doz1ejGnohxrUZcXSqmKyMnZ6RJJjThlvbwyjtnC5VeJ+B09cgfwy7zWhxSR+/nkK
 qWXKXICA8kZ8o4Nsm7ZlqWVCG73GKvyp8bDy/b2ufOZMpY46jfQ8BvVF2jr14w3Am8E5T4Jtiyl
 qm2Fb63j9VA0tNJoh9FYAQduKOZrZCaKYInUQ91BPeN00isGOmS9920DvQcJ4KqxfXd5GmpFOas
 oFoeiBbJ0gkyYSBoW5A==
X-Proofpoint-GUID: XKzCoV3yOdbyCnimy-nqD-xOIFpDXVQ_
X-Proofpoint-ORIG-GUID: XKzCoV3yOdbyCnimy-nqD-xOIFpDXVQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290032

On Tue, Sep 29, 2026 at 11:26:12AM +0530, Saddam Patan wrote:
> The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:
> 
>   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hawiadsp704
> 
> for you to fetch changes up to e13358126f692a768b8bed0a188a1933ccac4832:
> 
>   qcom: update ADSP firmware for hawi platform (2026-09-29 11:24:12 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1283

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for hawi platform
> 
>  WHENCE                 |   2 +-
>  qcom/hawi/adsp.mbn     | Bin 17086728 -> 17086728 bytes
>  qcom/hawi/adsp_dtb.mbn | Bin 180040 -> 180040 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
