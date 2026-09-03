Return-Path: <SRS0=6AJk=G3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3FC61DD3
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 11:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1826E1F00A3D; Thu,  3 Sep 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788436663;
	b=LWm/St2vp8hgWRGzmWscawpTniK9M7920bUbp8gbYWHw7HSQBqPe+y1EzA/r0Ct46PSX
	 x81HEIpDPckWO5s6WbtieJ4L4cYdH0eyGAXZgq33Q1gCBjPpdnv7IhGHmYdf7nabgyzD4
	 SOwN7SIN5ClO1rxWbj972jd9oFgSr9cAHKtEJaqDrh+XxNI+riXtfQFOFizR7e8izXONb
	 Jm7bnu48+2BmwyvqTMRJVZE1akglEma3beA0iqp5yEPLhfh3gvVUL3JpKQGhBy/SPrG3W
	 ZPn7y798xfybHt5D9rfxg+idRsKRivYS5ZD5Ahhvr4cFCo0XjtJaS9XOodfqKfJiGjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788436663;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8AB9anNvC6jWobYJD9Czj/gPa02V7IwzRA3zaMjZHAQ=;
	b=P5xkRxkCG1UD58AltUl3BHlWaPsF+JSVWvFhKij9H6h7xsnJk2ysr/mxaB7fG5V4uuMO
	 5KWlbFMpXlznnvoT9xrD5okYT+jZz7SsJTTwuc2S74nODYmbGkEf2y3+hmw5/iUhOND+R
	 nnchvAaM+Gmx7o+9PocBxt35NVoW2z299BRo5TY25/w6+OKKk7Mc12iHi9H8tkwQhJRxC
	 w4g8bAwDVH0Jy55VdHG12Np8sBWzfQj1IS3JzwMPCQ177jEb3DNVrB/KM4j7X0PMBwJMB
	 RbDdBv1qQEwtaEdP8qnlAus0e9xfnLzuyZgEJaWPzoz09cCAtdu3iay2IcGxeGHOJ0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8KGgPys;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kUBAHu3D;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77DBD1F00A3A
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 11:57:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U8KGgPys;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kUBAHu3D
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 77DBD1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHAOC212406
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 11:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8AB9anNvC6jWobYJD9Czj/gP
	a02V7IwzRA3zaMjZHAQ=; b=U8KGgPysdBu70+v/uuJi0jDzjV+oCWd17bt5amqu
	q4AuVE5du/KRNjDdEFzWFuZLavrxxxBYO8noJiNDATavJaUWOqMsq3ktOiFAPT2o
	uOVf61j3x8MWKE9Bc557qwmULzU5PHVSipRKZRkShYPhlMvvsvNrPwODyR8entdn
	UVRr+G46HErjAeprv33nzPlRO0R3Ksc3EM9fD8Zo/2wmszsZKrmrLONEFDv+Jg5a
	meYnDsExinjV/IS4nV7ZMkiu+H0mWK+r6jUt901oJZcRj6NoBmpmP+lrRrFpRuDM
	8ykUrMy3qWfmjdiiPtDYCJRxS3zrLT8QL2aPyZErAIJtjQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhr36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 11:57:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-738b76cfe03so1860360137.2
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 04:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436656; x=1789041456; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8AB9anNvC6jWobYJD9Czj/gPa02V7IwzRA3zaMjZHAQ=;
        b=kUBAHu3DD/t1mJ9Ig/eWwDZuzRk8RMNqboPqHiTnxEVIGmn7uhtvAuGsd6Hz4hvUXQ
         hW0OShaSFle6/ywqw1iNVIyoQHDgXd3gazZoxw8+vuZ1jPWEGyr/9WQn5PPPioF7md2K
         5GuX+3WXbrsWAjyMt1M3M0HoqEviKK3uqwp6XnG0MQcyspc4yWDWbkpYL8r/6gNiJDLc
         v1UC57roY3sQXxrjuex94yrkskAXFzgZ0kJCD/pXKNkaJ0Kvyj0w3LziS5GSMFqEviCR
         4ULEi0nuUiYOQsOj0A3XslLhjMKyukjCUWZmKOtD3V6z6EEP3HpyZP3dLKJydGjbAxbg
         lJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436656; x=1789041456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8AB9anNvC6jWobYJD9Czj/gPa02V7IwzRA3zaMjZHAQ=;
        b=MAjTyJUuqLVSV3c2iKwltPCIutWJKoY0CLfnvVeL7CUHp7WQhrHjGgtL0AxcKKfvxh
         V6X7sBwBHliLDUWr6zZpHO0gqcWLQVx+pHCMxh58gVe9uau+8Nc7bnLcpc/eOfYIEY1T
         x9La24/69YPCqtqMWnO7+ljvEJPTNZYBbgVbbEQ9K6PjQ16e4nTnEzT41aEPHBlEDfDy
         bfpbw9q1QPVNongLFfhm+8vBFT5w02HJ50lprMWfnFrofr9+wHxfPI+6DETbAk5KJLHN
         hUUZubWAatIZG4B7NHY2fnjUN8kfWahlctkrZsdq45+8QdsTRxZqVo3TBDzde6B+wtXn
         iLww==
X-Gm-Message-State: AFuF++n1MzxILpO4YQFtcI2syFx/jfhM2sxvh6X+dwJQ07Z9g1jKgO9i
	cLZ9DWisLx+tE6FcsvMdNE8eSUGgXb9ERhpAvjakk3zeqVR7+/4tsOtTebkLgsZz7xMa3iJkiGP
	xcu3HanKJPSkmS6WNCUCXC3RpQnByGBchb59eEK7iOjq9t+Oz+8xPAunv95PYb9U=
X-Gm-Gg: AYBFou0oFVSTr1bwXafnnbuRBIbMCGXVWqT1z+TonZGDs/ELY58dTiiHxxK24JPfYdz
	AvibP0/1HmX5UbH1VbduabTZHSJB1wFAJ56YG5DwgMzw0p1aGy/we0aS1kEedv+swvIjl81ijMp
	96A6G6/D/E31m8lW9iWvSDC/ZMF+lf/eyz3VBsxulo1T1eslgI4xaFSIypT2zScsyOJXmNbag3/
	QMqVxToW/zWU3ip1He8U369DAKvTXvvOEOtOmoW4btXsPhlMR2qTrkSyssMOonUyliTMgcMxws3
	B7uFByLCjYMLWSWXAwiSei/c7ffvk9aBM0DjHuNd4eWJTs8hS446Guz04FsQfvxTe7/DwORAfh5
	N1pJn951Tacbz3YIW4+cYY6UVaaaWmkH3QPRwYBmJGj/igZGNLibeSo3JNWkz3Uo7vTO7nWeLOL
	jZSPRIHJ7+UWNJ
X-Received: by 2002:a05:6102:2c0b:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a1f1d33eamr5227142137.2.1788436655886;
        Thu, 03 Sep 2026 04:57:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0b:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a1f1d33eamr5227118137.2.1788436655426;
        Thu, 03 Sep 2026 04:57:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad24618sm12194261fa.32.2026.09.03.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:57:34 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:57:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <akct7mefomhu64zl2iasuap6dcu43sicbni5cfoas7ih77zyow@iqnpzf3qcnyx>
References: <2884febf-ab38-400f-8f37-38cf3b0c801a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2884febf-ab38-400f-8f37-38cf3b0c801a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2x9QYbU8TObE
 ESJsdG1D3crYtaoNmCH8N/DyYLXOIcKKf8BVoTQ5tVjX6BiLK5l6kzDPyYEGvNJTP6N+uyFxNJI
 c9Zpmrw1yHa6sN2LPpBhcfg2HFNc6JCxWIGI5Wrh6FzwYuZFvcamqe8V6n/MAAX64qE7+5TRQ1Q
 xv2VcSmJF268uC03upPvYoIFDh7jfFV6piLfxH7EvVDu9HeoDdFT4xVMC0PzcgoJY7ovmjV1Lnb
 Ktpb69+oAM8BXw8XWENCPPHxamnLz4E6wfAbvwf+/yVI7d1P5q6HK8JK2nqZ5RPYARa6XDd1c6l
 dNQscBHD76hzl7GngKDVNMKulp6AR0NzGRcr3vi+66TPmpboqXtk7ig/JmvbK2acZ8LiBoaQ+kb
 vR5EMUNS7kVxbN1JWefvmUUNw0PJJObdGHCX2C4EZe7aeXybbMzDGJhiYfrFCcN5iSVqcl6V0+Y
 CaDfjC1ExuaWrkFsP4w==
X-Proofpoint-ORIG-GUID: cFgT9Vk35jAbpjai_G5EPsFh80lpueyB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwNCBTYWx0ZWRfX2lrMydxXDfEk
 Rv3zUJTJ64oCvS1VlEkHCK5p5k5FnhilQIcEQl8n0xe9DO4HQ/8B1D2mulToSmomtM+dW9NetID
 +cdShATaxyLDt2s3kqJmfCPkkYR75X8=
X-Proofpoint-GUID: cFgT9Vk35jAbpjai_G5EPsFh80lpueyB
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a9960b5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=C5mNPc5nWw_qRLBQ1TQA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030104

On Thu, Sep 03, 2026 at 04:16:53PM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-lemansdsp205
> 
> for you to fetch changes up to c620d583926156dedd51d9ce636e9ba06297ddfc:
> 
>   qcom: Update DSP firmware for sa8775p platform (2026-09-03 16:01:52 +0530)

If the only change is '    1.Enable Sound Voice Activation support on
sa8775p platform.', which sounds like audio DSP only, why are you
updating all firmware images?

-- 
With best wishes
Dmitry
