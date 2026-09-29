Return-Path: <SRS0=4qBf=HV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB82FCA5FA1
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 08:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 842601F00893; Tue, 29 Sep 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790669727;
	b=lHKTqBmrTHIN45Ts9IUHqNqYvg3u4tNMFjC2PsrR2UF/73iUap7/sGA8y8c9tUpoiegQ
	 QMESVNaZGYVqjUYREjVrqArGo6G374VVH59XtHPVTSdyc71JpNnDk5UO37fBZeBVnvTcw
	 u9tokvv5ZM1UKKP+9g/CelSnAKTOOU3bey3oI06nIfVoqFP1Pz4oPp/3XUR/2OPHKiLsT
	 62JZhdrSXaKmeXzkGZmJGdm3a0FYrtvqDN3WYhvWoK8KlW1+Tm4Xd+fwXvpvtbrs+V40+
	 GlL/+9SlOEXAN6Y67Mxk9h48CCRIjFqKPOk3sMunAkXglAfQvwFlibLIwJMjGl7zcng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790669727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AfozLU4SfJ+srDIVvNdfvhIHhbFpnZlQJ3bclQ/ovL4=;
	b=zbTQIBpkyT5qHRZjYHGvFse1SMgNY4L7+qwdzCMfi8wivO4ht1K3yzOcapyh6GmYoYJ4
	 2gPcOM5WJQbRMx2jp4y7hvABBnr9lGivRhoOQRDciuMj1CQ00n+fKLA6WTmrWvfFpB//j
	 qOTBBStFiIssB+hvNa+pbljYOE7LADNq2dSgPVj0/wy3Abs19sjA5eHBy5AbtTlnzgdy3
	 qL4H2ZcyaFKVs5FVbiIA6QETcDJegwklpoLAvfT9opxy5aRmuYwE+rqdEy/CYO8yVMMgo
	 vD0oabKcoC0h7wDOJDwbD51a3eMsorIsAvxiFrJxizf8LHnAzLxwM8uHmPGuf3L0gUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOr6fkvV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQ+RDFm1;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2EED1F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOr6fkvV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQ+RDFm1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C2EED1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TeqK141375
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AfozLU4SfJ+srDIVvNdfvhIH
	hbFpnZlQJ3bclQ/ovL4=; b=bOr6fkvVhf/iEYDQ282xg7bQKGVG3UtfHaCumiAv
	WNuGT2uYH2PRhtY8u5LvrSMYjQ7kp4zndPd2OsLIMfY8/wzlF4eGpnfylOA7DMcQ
	f4UOATb08B5qjV7g4TEsnyG84ybAntxsYO4fqfa7996fL/6x8R5M0uw9EwtuIBEr
	ZEOqOUR4AVJ82DhUWM+0jyQlOnAaG7HN7MJgSzM9dK+OzQR6mmpwrVI5XFS1P6rQ
	9oP4rgNzOXv7ohkS6kMEdl74rVhOLTYB7AHmXW4ieZnsB82ujmvSCAQVCAvuT8fW
	mrxbme+/6uQhHsyRGEZvLFC+GkrnZ9UH56+czi8Jrq4E/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0gau0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 08:15:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a01d1d1b6so716985485a.1
        for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790669725; x=1791274525; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AfozLU4SfJ+srDIVvNdfvhIHhbFpnZlQJ3bclQ/ovL4=;
        b=aQ+RDFm1vLsagwtr425DhTQm1E3HIb/0Uo/oOZukUyM80MXdn6EDsMj6uvimVMSDY9
         JeN1vwDAISRCYgmcEJMEr5lw3scaGmxHR8BIdgopZ8ASWRwa+nsntq9zf+6RJOCvNRMQ
         O4v1wMSWekXaICJA1KlWjkQ03H5FAnMbpbwVlDFPje6fRVz9twfsMxor7c19Tz6Fiou5
         diRwVuCksctxXJEJ6spHpg7dNDMwzZU5U46xoYN1qCYNMk0hsu+QCWRqPFxI3WTL4WEU
         Zllr5f0ZBvWl/TtKfh+LbB36/3ccc10P4CC8Ssw3nLYCilwqtgb+QVlgbluLOeI/xc/0
         7LJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669725; x=1791274525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfozLU4SfJ+srDIVvNdfvhIHhbFpnZlQJ3bclQ/ovL4=;
        b=C6zIQzV7TO+Txatmh/PdSgOEk/pP22WLPNDFE4K3/4A7p/JrHid17CezKiAd75lryb
         GxmAWwPukN4evE+PwvJKXwapWP9zE4Zy4ADyaM2nP/D8jXqHb2/AhIuX+BJnJnP1DNfb
         0PRhAR4eYcm0TgjDuBbCd90aEVEqfk0YzqnnxF9cSJD4RChBlP9PruFxo+Tmr6CUF4GT
         XNbjwaBIsRUAyE/8sRgl0FvVkcBYEoL4UaRVEZ1M+keVmamZMqGleKW/K8lPTQZqbprA
         oGjfQYp03bkW0VkPlQzAnsYPcHyHbsUQg/T7DUGADhbBNckl6mxEKZGi7BAEiMeMLjA8
         SX7g==
X-Gm-Message-State: AFuF++lUbfn8Mp5Gc8Bm38Ynu9WJQo/6YO51scLedUBKUF1U5G8mfDMB
	gOFVVdrB1B89u76v2+r5EbkzzYs9j84zWRweT9jBLP65sRxLhavBDFXHxWDtBJrM3vAb35CpKKg
	kRyoqFxiM29izGKP9s3d50xY6OwozRauWlE+THz/ZG0PvbvnCmILm08KD9ZznSXg=
X-Gm-Gg: AYBFou2yM1224tvcWBcvDH9ojzUGhuIXQUBwbXjaInxF3rOVWwz3fpETwwJMsBRB9cu
	iH+vsaqZYhRkcIFExLHyWd7TM3fyRWu6pa3LBHbbc1jAG+WrWhtxtibm3vxcgRxLKa5EVbGLoq5
	w6WHfYI40MA7zJRbubnjOdegH15cEkBVOAFWzSyocZwG3G9SnP5BkOHmtYvZW1s7+ppsqgTcyne
	gB4XEwQ9h2r7Ai2a8sRTx8WThvwEmq7ylolfSGSMx8jy81CmnybEZrWieGfvbZo0sLApSKXyUJm
	e0B63QT0XaMSWRLeNwIQ5XqI429BAbMLHUdaRoA+1SCGiJjiJqWEtlPk/iwtXXtWHXEBnPuzzve
	76CJ8t12jhMoQsAPUhoy9f8Nsy7t3glDOeuBE8DfEsBm5rpnBJq4/oipjbfrVtk6ycYdCmSekfb
	5jN5pvfahVndEl
X-Received: by 2002:a05:620a:3711:b0:93b:e578:5838 with SMTP id af79cd13be357-93c43b86652mr2612463585a.12.1790669725078;
        Tue, 29 Sep 2026 01:15:25 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93b:e578:5838 with SMTP id af79cd13be357-93c43b86652mr2612460185a.12.1790669724571;
        Tue, 29 Sep 2026 01:15:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6559cdd9dsm33139251fa.1.2026.09.29.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:15:23 -0700 (PDT)
Date: Tue, 29 Sep 2026 11:15:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
Message-ID: <bpwercpslsyla3njf7wdhg6maqvshmswpt4dbcozhmwd4lxvjw@yarcocckyqdi>
References: <131468ab-ba9e-467b-a5b7-c645320965fe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131468ab-ba9e-467b-a5b7-c645320965fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfXxfQhI+0Gc8P6
 08kOsyQ30TK5wQG5RyIgci1C0yMKLOFRANMHzfWx4+dC9A5Ot6mhloWJ0roZfqbsrIJT1OgAqT4
 vcm81nYb8Ikm+du1UyOkeHMldQu6d/8=
X-Proofpoint-ORIG-GUID: gLufRak0waBZ7wEi_nXNft_ZApcnr7wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfX+1aTGZfNge5F
 H3ZKGcJrP2jpOlU83AS/v55BCdCmJB3SPejwGldsanxT5J4sVfyrVE1zIUN/kGRnD/jeceFjOwV
 LFwTFyIO3y0kBblKpa1SZ3oncDeoxybv6xBmXcBAxxJS/gao+unG5OU+3J9E8TKIuO6okr5eblg
 4OTYyENRDaU2QC5gVr3hMPKodtDQwT1mEHQJFMrhjtqJF18XzW8wjPgJqztW9zGinVdu3lyjzgO
 +rqkIYjoQJbzH3Q8AUWbX7i6KiRWgUFW+rBQfXYK+D+4nc7/9/1RxSPoGhB+U7GSaPXJn/tTJ5N
 YXnGlsQ/3/bKZe+dLkGbytm8X/cBqn6GMZoWdYAlDBcqR2onccYlUFvYPzlx0CA9A60g62uwrs5
 iz028DNmHMM3/4Ima+oPWCZpGeubrq/2EtzkrlTKxOLbDu+bVuVE1eP/jieYXmgvIjGncQC/43m
 MaEk+xphGh9GXCReV+A==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb739d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=lDChveBGJijprWQPpM0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: gLufRak0waBZ7wEi_nXNft_ZApcnr7wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290032

On Tue, Sep 29, 2026 at 11:13:41AM +0530, Saddam Patan wrote:
> The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:
> 
>   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hamoaradsprtm
> 
> for you to fetch changes up to 4a4a017e7cace118dbc110007a44778f3d12f080:
> 
>   qcom: update ADSP firmware for x1e80100 platform (2026-09-29 11:07:25
> +0530)

Why did it get the .c7 suffix in the version? What does it mean?

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for x1e80100 platform
> 
>  WHENCE                     |   2 +-
>  qcom/x1e80100/adsp.mbn     | Bin 17922440 -> 17930632 bytes
>  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
