Return-Path: <SRS0=Pxn0=FZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB88C55167
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jul 2026 16:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 828001F00ACA; Fri, 31 Jul 2026 16:43:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785516194;
	b=kFMjiRNKPuMlJQQP0ODpVNPJMLqqwqsYBK+rvCADTI5A9VPm/CUw8057hmiBuYlk/hLb
	 mfjr3bF5H5R1Qi4IvGvyfilMrJsm2z4yVaoJo7ZChzHDgz+hiy5Tz7uukR4hZyPivWKN0
	 1qd+ap85I1jaBqqahgBgmYFuNLgKPMKORrQ6mrda8vwLc59kqMyntZd/BrEjgqU78ds0h
	 QIKToRwOjKh8ylxf8bZTOHM9PM3ndVaAwwsWQcJU4IrRAPHVjgIwLyMqqWzQ4JbKASvjL
	 qfCwAPOQCd+egoBN15bdZbcMYC08yUpA0yvu5KruqaieTjpAwZ4+f0EPij3g7MjhXlQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785516194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K+RT8BSnVF3Jk4Z5adO3ycF9IX8/1GcoYCWz/B8PAzU=;
	b=kE2EsSHoQ7hk7XDoH0NEBTdMAEnJ4/rrfW62ZRa19BhzEi9IM+Eg3UMxHEgqKe04eTs6
	 oIEw7DgjEu1hotGUd66MmruvSWw7qAJLg9OuNxISMJj8kO8Isqxpj2A5t/pUCdFwd4p3k
	 qPapi2x9AWlD9/L/q59hr0eiPKWBZlucIEjmOSSEAaoLPI5xiFRM/y3QqTWR9VocgCp9A
	 7sMh+CFvYyoKbkL+fvTo/NINbX4H9EiEgew1mhH3q/QMOJoufB7UfiEJlCUzPH49dKbS1
	 BCI4Wbt6ThyS6YjApr2HnlYo7B9R3/hu7B4LH7zpg7zs9HwAkKe0MuQtAXJ2yrhVzHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eM9LtTW3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGaGsO3u;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E97D31F00AC4
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eM9LtTW3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGaGsO3u
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E97D31F00AC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOVVH403798
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 16:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+RT8BSnVF3Jk4Z5adO3ycF9
	IX8/1GcoYCWz/B8PAzU=; b=eM9LtTW3iHeOyWm5OuhzmrHdOvckhHdETRGSYQqx
	bSkCWYE9/dd+aD7kJWS72PgJFQHOEoAgEYVGi4lwcolnsy9SGTNm4pCTWAudsAdC
	2VSF8y1qnHujQyUrDYngUgZDZTqjpEtmIhP9ANoyCgWPVf74HdlzeacyxhmUr1Hn
	1NHvhoKKmup3wxjFVmNEMiitbqrwIVWNrP6gTHylMZxWs569I/AwRw5FEJKcXCo4
	s5puTO9KfX9K0zPjbuAcBJJ2T09V2yMiAi7VDeJzwiqTAMuHNvY3htySZMvBmkMO
	T6Le27f6hRpWfu3p6Aaes5WiglFV3IH+/UqDo+aiVstIJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkh6k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 16:43:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef18406878so11640926d6.2
        for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785516192; x=1786120992; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+RT8BSnVF3Jk4Z5adO3ycF9IX8/1GcoYCWz/B8PAzU=;
        b=jGaGsO3uV5jdHuH0FKv+JxUR1h2aBloCx2nxk8d9TGQDVBNsl8WRvTVCN2VSgD5QOA
         MLaPzKMVXl9GD9pdbVpTxV9JeFTMXT+QRBl6cB2VBnvY9YBbW3AtraIRlGq3w3boQAJA
         8pKQ72gDOTOiXZWB1Tep/Pl/2DzlaQvm7UbTlp9xZNm1R5KBqJBTe58p58ttkwQXs1pR
         b67ODoFJ3ZoOG4XHIEkvm1fE7/b6xikwDezI/bg0Wo0MW+nbaYG+k7el2wt7kF+5c46H
         NCjHdbYZCRk2YtfqRL56SZ2EvcZHCAEygsGt5O1mVuJCayDVL8IlNELPHaHZZ5m/NG9+
         2tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516192; x=1786120992;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+RT8BSnVF3Jk4Z5adO3ycF9IX8/1GcoYCWz/B8PAzU=;
        b=EzVvA7fnHzJRbSII3j1UpPSelnpEsWgDT803EYLYeKAKCvo0FIQ2puKrn4CRSKAKdH
         eigHWD+C4cW5AEouxQlH/ezOzodp8cNXCpEkuxh1U9vnofdR2CU0q2e3ugv6KNohEAgp
         WDvZq2BHkzv2ev49ra75nJ2BdGg25fQJ3ybKOYK6IonrDtU9zpsGZtgjbGKvQ0Tpkqoy
         GkQmQUSU29ftt8w/WnIy0/m1joBlzi3k9EMt1rEUUBa09hamXqF1X//H581eWeoTXLmD
         knuAl9r5pZvr9dQfwEcLWxoj0BAWVzRgxgYDW7FvFdzbsiCfnNbr4N63ro90Jt8Em2gf
         AxWQ==
X-Gm-Message-State: AOJu0YyaRHza0XzAQrxeVYI/gMqWh97W1tYybFfmW3U3uVzUQDPE18fU
	lG2gMcATI02LBSb1wOWSnATOBUhcZFnfhegpluMl5PdszTEPq3LQf8x8ariJULL8B1EHZ96rgQA
	gpWFMbg3mTmdXvy4araEr99xMV8DgVoeOK2DPbV6N9Z/U1PE/efCMqyA/ptd35GCv+tOTrOU=
X-Gm-Gg: AR+sD12I3njUUKiOlnqye0Sa/OAlS+Z6iDUdTf9VmXZV6GPpuM2abQXZLnr18P7XDdi
	/FZrhzmwCuYxkJezjLak9rdDq1UH7SEpnUTI4jElWoK4Es21S1xQqg2sWJN2ze5PsX6QHuk9JRc
	lley/U+5ZKYHSKJDSMSqubDmDu7ev1EyZhhXf+hYOcU+EkUBgtyF8V0HYQYCJmuiMKBcolR7a7D
	gi0Vpim6ON4m+d9fF+xOiu8YZk4G28d6fy24++mBla+OvfeYqEfR/MUFwqpjYf3SVf4z3VybHHF
	4+1FdFZOm0RFI7WPt48H1K/75JzpBG4vHeb7NanYR3an2FVvwUb+PbZ4JfXQe8R8YRLdcUsH+sb
	hndSH+E+LYHwrbySRMafn9etp/J3/A2rUgEEsPLhGxXVhcdyrXJv1fuIYTrofHBLO3UQNby1idh
	sfb/hzIDz7DBKe/A==
X-Received: by 2002:a05:622a:588a:b0:51c:a7e:4cc2 with SMTP id d75a77b69052e-52b567dd3e1mr18553221cf.20.1785516192169;
        Fri, 31 Jul 2026 09:43:12 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:51c:a7e:4cc2 with SMTP id d75a77b69052e-52b567dd3e1mr18552501cf.20.1785516191532;
        Fri, 31 Jul 2026 09:43:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbf4fsm438380e87.31.2026.07.31.09.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:43:10 -0700 (PDT)
Date: Fri, 31 Jul 2026 19:43:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l57: Add firmware for
 Cirrus Amps for some Samsung laptops (20260731)
Message-ID: <ygdavhmtl5ubczc37ka4yoo6svprynkxhcrgxzii272ellq7st@dckdii4cuknk>
References: <001c01dd20f6$37130560$a5391020$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001c01dd20f6$37130560$a5391020$@opensource.cirrus.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX6XXvW51Mz5Z7
 a8Ax5zqQnor/X8ptv2LZKYoeIVAAIb/Fb6i9z1YzhAspUfPIsRz5BcJ5mzT2G0IMZNzCEBNon3I
 FD3LUtpgWYlzpWceHBgKCu3gxYUZfx0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNyBTYWx0ZWRfX/kE9pzYlHiC6
 nkr1cGYi+wrm8ZElkabrrgXtfQ0I0DjUa+AbdjLmrhsmp2dICFkMsaK+m4tOXa4c73wnx28iXh9
 hVqTBQAU9v2QD/KsbFjxjWX9dJXOOY6cu2kdnB9B80Mx8bMojvUb119VNHsrJy9iPiv9+XbhYNP
 GRoI3X3OEjr9l6N4rtFeiRW3HncnWXsGjcKuKe2szStx2abtFhUxmiLTnx5/lds0RpZqdwNnFCj
 OfThLbI6R8LJOFIZKpp1qoM09HKWTDXfHYW5BM5ZmFI+MWCpmA6e/BzgnZEC0wFrykZru9iOknD
 IYh6LeEPPuTbJOZ2TwwKWUIeAvwJO84M7hNTr3bLv8gA0dA8eQ5IA6tPkj1BfCt7sD66fLDIYmk
 tZ43r+iERPwo1ANsiEz/rFv1oMz7376l1XCFK5HOcYA4CzRfyeiQCU1bp16KH6qb1x83kiNEp4I
 Z040ZcG+k54LNDmCjyg==
X-Proofpoint-GUID: 3cI67ILWepYgEgXPFYB6SohgGaClg92p
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6cd0a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8
 a=Q6fjGm-LOi7iehv3pVgA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 3cI67ILWepYgEgXPFYB6SohgGaClg92p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310127

On Fri, Jul 31, 2026 at 03:09:34PM +0100, Simon Trimmer wrote:
> Hi,
> 
> I'd like to add the Cirrus smart amplifier firmware for a few Samsung Galaxy
> Book 6 laptops.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1159


-- 
With best wishes
Dmitry
