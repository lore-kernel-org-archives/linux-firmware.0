Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E18D606A329
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d7aJ2CDu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSv4nRGU
Received: by smtp.kernel.org (Postfix)
	id 2000B1F008A4; Fri,  6 Nov 2026 20:40:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793997628;
	b=HUopqGas7n1G3MiEMnCxpWdKTMxxcH/P8b/PBvgBjbWwDAvRg3wzjX/XiOcqnpfAJ+jG
	 torPxzLiPUUlItWZ63MO9eG3diNXcFwtQGL5i8H9WqbjpfC6jJIS+GNY+TIgoUtyluQGe
	 cTq2UX4ycdfSY8zmzHTaNPKMQqtS6YyfEIwIQv+opdrOm1DfC1HeH+YzqQMUyL9QbhIGn
	 gXEUeJuSmYGXRl6mu55QpW+oGCZfTZBv1VukQHe5DOXbpZNR2tsYv4DjRBwT+ZlEEQ5IQ
	 LZ/hJ7QpdpArNbGBiRWJsQpBiYwwF0um9VaAggxje+d6sDLtstEwH3YQFS+g+VEursw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793997628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xk0EM3tC8n39O9Xnbboh8fsr55se/hoS+ibBeyM/E1Q=;
	b=1jRZNq3oRFIWVIPAgVnMsGUpSK78+vlTzZYF/X+ne1KfZdSHxUXya8ey2nswOv/Z4NGX
	 AMJl1K0kVlQ/kwoS0fbisN+O6jGRkTJ7vBa20ERHkZSMTC83twU/Du8EOQC6HkX+hxiPE
	 l6G6bdLwuOOsRfZYpKVp2QIgP2pH9nJlK1MNHJafzEKhu82dYk7sQqYzgCsBMZ1fZOmFZ
	 P4rjCckBxJitpVsn3FAAfuxQCCZWY6I3Vt9HMs7QKbSeT165UDaIK8k2ZB67000nUIyh0
	 fMOcgmFqz/69AJqIF40bumMGjEyReyPlVrkeXoUWD4QU92isgw0u8N4w7aM3gH+BPbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d7aJ2CDu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSv4nRGU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D4A41F008A3
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d7aJ2CDu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TSv4nRGU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7D4A41F008A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JLMhu620040
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 20:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xk0EM3tC8n39O9Xnbboh8fsr
	55se/hoS+ibBeyM/E1Q=; b=d7aJ2CDuX08LZD5pY4iOVR6nikBQjkL12YGNqq3H
	uEth+AO0mJCjp9fnU+S/5bxAqV5L2xV57Jiz75tGlheSrn9PGFTkuRQQTpEo92QB
	FG43ClcPjKTjpqzNLKKuP2dzKgWlqtEM45AljsQrIzN5eAkIkJOgn/act/rQz4gP
	ji1qSmSaz2RviB2bFQ+N799eRG0Ya9I8ooaSL5eAMlEtomcx9+U8SX2Rv+7R7Nc3
	6y1o3xA5T6ZEuzDs4b3eSJs4CWUyobkJpfzz65qnpEOPATbZrjzg4b7Xiu0fIWHy
	TiJYOfAADEewA1wru7d9q5FSjWNxW+PabL4r5B0C1ctf1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv095u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 20:40:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53395d51187so17466521cf.1
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 12:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793997625; x=1794602425; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xk0EM3tC8n39O9Xnbboh8fsr55se/hoS+ibBeyM/E1Q=;
        b=TSv4nRGUbCyqDHYKcDh+xSfvBXjIlkWOaOhVIG7eJkAA3f00fOJbRv+PkwCiVmhRsv
         b6Gw1j6K2KJyxTRGv6OF9ObbjyM8Go1SiN4GCIpVKJCKXjqj5HjbwOjBqJRfWDlcLdPY
         ySqXVOISVVlzjBUh7G5c/os1LvdHR1gZwKg5dp/Y2rht2TdpD08OKP08begotW/cYFLn
         zjBVw6PsAoVVEpJwPNTmNrawDSQUX71tRy27pfHN0fUulDfRaVZjjXDPQrAekljWR4Ll
         kPZjURqyFy1akGH2O0lPQK0oz9G0y4T+fkfxtY1nhZ3dZ0UrmVkIxd+ND19mpfvwwA0v
         X7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997625; x=1794602425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xk0EM3tC8n39O9Xnbboh8fsr55se/hoS+ibBeyM/E1Q=;
        b=eOTvQk1F9x8XZU6sFH+uTQpbGLwsHEWQevzQmrDyi4okR6vavoFxSTGzgDOZXTQtG9
         z6br3RRym9ih/cage/8sWp+gTnUhxHfcxoqVlBVT/zaUlHFUJJ1RXfEbsLYsFkSGw6lx
         VGjywfianfx21BqW1gmXtdBmKYTad2YWYLvHcjQKFNCzfu6hUcAOTxwaqqSdUIOcpdz/
         nEvkFwMvHpk5gADCBqZHIjMZbf2bYJIPdh2XEP3jVx0L8spEu3Gaxt+BbyeSrOWItMZa
         2Doq/S2n9qSWEkVfxaa8S1V3BDS8jMSHgEAg+I936WZtSTbZFTRf+/h2PcqO1vsghNp7
         L5pQ==
X-Gm-Message-State: APuU4Z/6spB+NzJF9wEh6lTW3o5re6oz7OWJfDyIoTVBA/273QYlQ+uI
	eNvXUx8/ll+aRKmcG6qQCAFjNnmNx8q1+eyDjHwM0hJLLzDWzoSPDNnoAWAJ6RyWb2WhLnZd7pO
	RB4XGUES7OzqLkUskpvLKhT4TC8AJIpeiVr1U//Sc5sDqZctWPxWRMVhSqRFqBtQ=
X-Gm-Gg: AYBFou3+drt8M4NS3Z1PmflwYCbx81EePTuaN1emH/74Vb4jgfwW/MklNs9CQyYZYdL
	z0CfwcNifCnWEzkao9quVF6bFvjSqzWGFiF3+VQCSDb+nf8BDAayXpgw+wcTmd0oUNxhReMVGUW
	8Z2hh84j93CoC0nDP9/Y/807xWrGXBf6fbUDoVVzTxB7XaBhzmWiCGc7o2MZ73xwS/G/ZhFSekF
	zAZ8qtfsOpT0khkQcH8/EhSpPMW0NhvjuQsc1O7nGXAm0XcgE98O8Ry9zn9VzB6315mZeM55BS8
	gWVczAAfP+Xc4UQE3HCExHUhgSAEQvYutjz9J5itXhqGcGqQG7AdF39hh5TK2dudE3cnvmsgo3U
	m6QuLQdy0PMhmcvk9eJ2ldxpwXAjirDP0jnFs0njrCHXuzIuQhR7GlNPXt6p/qFQ2p5iU+Y2m1Z
	Iyth5260cFeSr+SvGRD75F6tMHdQo1zeJwkPSvVvjP0Z5nMb95r9/6DaUyz0aQ
X-Received: by 2002:a05:620a:468d:b0:944:3aa:520b with SMTP id af79cd13be357-945f34662f3mr583390385a.16.1793997625325;
        Fri, 06 Nov 2026 12:40:25 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:944:3aa:520b with SMTP id af79cd13be357-945f34662f3mr583385585a.16.1793997624824;
        Fri, 06 Nov 2026 12:40:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed5629sm532333e87.12.2026.11.06.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:40:23 -0800 (PST)
Date: Fri, 6 Nov 2026 22:40:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dbaryshk@qti.qualcomm.com,
        rajup@qti.qualcomm.com, raghukan@qti.qualcomm.com,
        kbajaj@qti.qualcomm.com
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <podbf6h5r4eiavch2q22uqivlomvbyqxmunp2htrwmasjzxhdn@7rzditqtz7fu>
References: <c00a557a-4310-4660-8c92-c7388f7e5a50@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00a557a-4310-4660-8c92-c7388f7e5a50@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9XW5SqY0UeQl0rIyIB4JhgiRo3BcZDH_
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee3b3a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=pEN_pnXQStHhuHwENk4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfX0oKYbT0Z0Fu8
 36ueHT2GdG1pTOO8y045WvNn/JPxvGAzip2W/Sfhd6dI6fZtaK2kLOctIBW05vzU9Sg10Osak+l
 3Sy2///DZEoCHnxIe9rzNSyYLfT4BZU=
X-Proofpoint-GUID: 9XW5SqY0UeQl0rIyIB4JhgiRo3BcZDH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4MiBTYWx0ZWRfXzckcD2HkSie+
 nLmxAIP1KFA1TZOS0p+Z2rs+/xsNxJvO4QVW6NmULq0Ynxfu55vxdM6cZ3VPohSU1mtBFJcyANf
 09Q2ezMh8w4hHZotft/+7wG2BiS7I/9SE4yZ+M1LeEiVvLKnGkXoevTV+ipOfHzRg8vGuU5P8nq
 MRuyT1fYDJNz3aLAyd/EoggeYQqjQZU6S3nbl6P+faO5KKHJNbZUQknMe4bcfhLHEoGf8ET3xx3
 Pss6nMMWcEBOOaK3M/j+r8ug/1ayBf+xntG+oxESbRO3IixwY4obwP7FE3n9B+J5ldz4y5+UQ5Z
 vcNavIU7L+X8xGr9Eu9WAkNfhSqojND9Fce9FMXO821XUE0xzfjha6hShwxdlO2Fuv5KB/a7eiT
 HXJo0ETUpCDuvJdGWTy96d3HN77VIMaks6p0Pl5j9w+AZ+8rB7y3zi670kaDpVUsm5laU6Dx/Dn
 5di9/MtCQH2mxNyINmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060082
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 01:51:04PM +0530, Srikanth Katakam wrote:
> The following changes since commit ba7155b16ca701e48018e746a49f7c9aa8392814:
> 
>   Merge branch 'robot/pr-0-1793892246' into 'main' (2026-11-05 15:35:15
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> modem-fw-shikra18
> 
> for you to fetch changes up to 308a73c07144298b24e96315b71f7fb20fe88a77:
> 
>   qcom: Update qdsp6sw firmware for shikra platform (2026-11-06 13:27:21
> +0530)

Thanks, merged and pushed out,
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1364

> 
> ----------------------------------------------------------------
> Srikanth Katakam (1):
>       qcom: Update qdsp6sw firmware for shikra platform
> 
>  WHENCE                      |   2 +-
>  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5668216 -> 5668216 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
