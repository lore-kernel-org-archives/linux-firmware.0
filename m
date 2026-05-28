Return-Path: <SRS0=H0Lu=DZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8445ACD4F54
	for <linux-firmware@archiver.kernel.org>; Thu, 28 May 2026 13:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6ABAC1F00A3A; Thu, 28 May 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779973685;
	b=Jyc4Ma5UyaooXBFwKYug6msPuppZcHmTfKh2Dhaf/9Px/4RITpUzRDS+tRUQ7hIXQba+
	 7C+xZWIIzmxfl2xOgqGcwt3VQm2wv3E/gDmo7RGe/kEqI3Q375rp7erbA2CL4cUASeI3C
	 5J6gVeNf5Nn/kPioRiuWNiMaFPi57pN6flbD2hWCihxwQUsSbVet4sixr8QXyhkw/LaNy
	 Xn0VKzT9zA+q9pXQ1XylbIWZZAAihjEqnaTxCTGwVrb+HpaaYlvWAiqGRg0+O0NpOnUq/
	 KZCTLbwGBrOWxIXP8Yz4gbExpXlO5z/mDV4CDJhOIHgwcPtexovJ1RQTq1t8t5jCe7Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779973685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9o4wPaysKOBdyreFiYA/J8awFLbWfTUws8sq+ITYIc4=;
	b=n+/Zzu9fc0gnGHIy1oMMcujvzQ68nN3YX4CwVT+RjKUcyL+p7dm0He5RwgrGuGxYYp0a
	 C27x0ld8Mv5sByMfyqwnrAL1Qm7Sapfh9+qohFmWL8HKThvb22fxe+kK6IYqjnUkH8gef
	 rUXAw9UFDRHAWWaUaE6vfnYBbo9xDUQIyvSj6cMCu9y4wG1E+YtlBnKEwEy9OBxdcnqRc
	 LHasGASbwZu6GwWga0bFcd8ajpchNmfJYZ2GaOoQ2z9CmyFirO3HzrJ6MfLjSU0UfTdys
	 sAfrkhASlyqrUvFUbUsyCJan5rR/ehGYgrdYv5wiHKSUHwIAkNXOdR7Q16CNssd84DA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRw9FC+r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FHN0la/V";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF1F41F000E9
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:08:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRw9FC+r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHN0la/V
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CF1F41F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vKZ21562573
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9o4wPaysKOBdyreFiYA/J8aw
	FLbWfTUws8sq+ITYIc4=; b=bRw9FC+rspAf5XEusUzgdFuAPzzypKqC+krNeRpy
	hwc1PuqNoU2XTWX6A6iStdt3nG46/o/XvKLPBi2SYA1H/SCavZluYFwOjZU/tXyP
	zxUNk82prKFlIWU17TqWWOZ9B6VoANiWTFeq8oDYB4SMHcbNcHrIUJ5OulzsJMav
	Xqrrja//i52WcLjFQHVKFNGycX8upV24mLtrGkd0kL9BDdnhwLFaRftBPv1e4rVk
	8UiOA19rPe3t9sKTOJ6Fydj1qUcuecrb+LCYjfDEf/UQpwG/tlaj9CIzz2/NjYOz
	D60eFMuToxMDnEw0aAGNf/bwtzeZBXXjD5FmRQKm297Zsw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2tt4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 13:08:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63146b7289bso25465832137.1
        for <linux-firmware@kernel.org>; Thu, 28 May 2026 06:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779973683; x=1780578483; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9o4wPaysKOBdyreFiYA/J8awFLbWfTUws8sq+ITYIc4=;
        b=FHN0la/V8Y5bT3qeGLRoYNshGTFDjUglEpk33czLfCYIv+y/pYwg7JWnbNycVIcBTB
         wjx/cThLU0nmU3x1+07lq9NMOE0XtlUmqxJWgp00Uu6tRJvnUV6Uw2CGT3mmyMo2ssJO
         XVWzoo3fzUjGlfQ0DEs7GTFubcsfDTLUDcEquWZP9bebQPEIY+Tb8MBubhEk4ymK4x1n
         wQGroyNnoA0SGUpuayQFQZjpZWW2b5ZdERVdLijq25N6Z6lmKjJ0e37qt8W82fmJl26X
         +yUsQj8IXP9xAb+V9AtqQ2bbLWO+dXeG4yYWqKgJxiFq3UooEA+4dYGflZYjWANZDW4j
         laug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973683; x=1780578483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9o4wPaysKOBdyreFiYA/J8awFLbWfTUws8sq+ITYIc4=;
        b=efLvhh0P4mLHXjBbgnsXl7MajJAyMpeAYbWQf3HbpZjJNa7dkNYwjrojAC9T0HcP9I
         oPtTRi6NITMnC0DWRHB49y8y2eQCV0eGXy3jKNf0jOG6tS/iu6cdjM+kbzDXPAXcNUQM
         3j8CJvCSnYnqceY5XiIAm34ZK9Ws+ODxeyhP4DAYAGXK1ajszZeK9gMRT7DQYRjAtR2D
         1ieBFchjdWHOchA9bfrDHkHTNdoCjk/6gI69GvSFrVlxtywRTGn6fLHiHdkB3qoZZaXw
         A+0dwNXV1ETqVr7urhaXBVWSqILLHCA83vMrxhUGIBDb3/gJ8cGt32cBWDc0OYjQ7QZ3
         aNGA==
X-Gm-Message-State: AOJu0YxRwAKZO41NOVUcGDsjzF4tsPgdMVbQe7yFc0ymaB2BQ9HsclAj
	f/D4/3EW+MqsoHW2JcBzWA8CAIt+ZB05ZOq6aZSP+OBYMem+VP2k+IEHoDVmfE0jBSqpOiG0ypg
	9aartkX3AU3yvjXykO7ZvpwmjAImqW9U05CtE6TES27GiZ7tLLNRxA3vUbuu7jH8=
X-Gm-Gg: Acq92OG5+x3jpZ/TQpCov8sFmW3YL1iYFfimPzKVPyL0bxKY/TSO+BeSUsfM8+JQBcR
	lnfLummvtQ38bkfeh19qxSjjOWe2OejKeywd/yM6g8lBHU2RDMFD6YHk+LHya+V1NwOKw5uM2r/
	OlBEDyoxek9aAC5RAQTHbH6I4ow7vR59/MIiPxEGpafccqC1/n7XIY9XBRiFkdwkCh6JV0+fA2N
	QxMXdNgMGR7hWWQV57PUOjErwYvmhK6T3NfR5GOpt811Y87MXmaeGmaxZG2ruGZJwVfeHGh2YGS
	fbEVB4XkwxYQ1FnZN6ZIL31+wPscAxgy5GVDDMLsCljyZNGsBBvDPh9EIaKNbv/SDQ2GXyakJh4
	PiC4JspqDHNuo5l2rfPXKJ9xaL5XpdOAwCGk+ZAqG00icKewJkpdXTG69qvdFDxax0uYW09SfNz
	3W7xy7NtRN28BbOv+s/2ce4DKVkropqOr2ayo4QDzLr5eChA==
X-Received: by 2002:a05:6102:6308:20b0:631:31cc:e3ef with SMTP id ada2fe7eead31-6b8b28d9586mr310393137.17.1779973682960;
        Thu, 28 May 2026 06:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6308:20b0:631:31cc:e3ef with SMTP id ada2fe7eead31-6b8b28d9586mr310372137.17.1779973682527;
        Thu, 28 May 2026 06:08:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2c6efsm42896951fa.29.2026.05.28.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:08:01 -0700 (PDT)
Date: Thu, 28 May 2026 16:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Add Cirrus CS35L56
 firmware mappings for two Dell laptops (20260528)
Message-ID: <mn7vgjusixy74o4ll3jcwq4p3xbd6feeu3eps2a6tmps4qoyj2@jdxh4wnohxq7>
References: <000601dceea0$fb2116a0$f16343e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000601dceea0$fb2116a0$f16343e0$@opensource.cirrus.com>
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a183e34 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=MkB1DhqyvSy8IpOsdpwA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzMyBTYWx0ZWRfX0xccM7C7pwZZ
 HSX+mM11BOLO+2ufPLOrq3uoO/BBvUFlFDAo1od5NRDJW5QGqlcPOhVJGYuBaWQWIeV17xR4kkq
 cFmq8vbKXryO6Z9tynElatdmjn7FF3PAm7Om2X8IY6PVHcjJnKJn5UMRi/yDEw5NjEBGaqFaPvP
 AaGwX+ca0v1MluHnWZNRF2r17fuGrnUVvtLWdV1xZhSz9sh5GDURf98ZEwmvIZ8IcIeUKFNawXw
 xpCUe9saBEP8EdFaJ7ck6GdoPAkaEqQmEYr3lvY9g/13jWOo5yAk+p/gCd8tSovHS3Il9G+yrVx
 PajaJM8G/94dO2b1asZYHOsaIMkVlBwD54le098JwTgdox5GbRRCjKZ/HN09eWO5kvANCuWWOiJ
 pGaQkauke+bmCAribtkLmH+8d1QP8JOjF0WG5kjJmmczHpOBtD0pUokIpWqaePyws09fkhl32sE
 UY6i82RUnvwq1N0b77w==
X-Proofpoint-GUID: -kUMCK8bCJgmtdAMPhouIITTOc7_5T-C
X-Proofpoint-ORIG-GUID: -kUMCK8bCJgmtdAMPhouIITTOc7_5T-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280133

On Thu, May 28, 2026 at 01:53:28PM +0100, Simon Trimmer wrote:
> HI,
> 
> We'd like to add this patch to enable the Cirrus smart amps on a couple of
> Dell laptops

Thanks, merged and pused out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1067


-- 
With best wishes
Dmitry
