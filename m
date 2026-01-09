Return-Path: <SRS0=be0w=7O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C74D1681C
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 11:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C750C19422; Fri,  9 Jan 2026 11:53:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83CE2C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 11:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83CE2C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098Jolj3727729
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 11:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0S78E4OCVBcJXBS+O04kVMmi
	r0HjoOABblyWwGQPnI0=; b=VGD38fvqFZXnFGvl5ZNNERURCP+1fcg2nBdP6uIc
	ciFYQLBrKTRv+hiRz1WpDm3UQiu8jAORPtYNwa1SRq3U8sPAJa0rPtZA0r5LWBUA
	RNh3+GyW4lt1l+xskK9McMFJ30+W74J64LuAKIJ1agHTG4EXPGrDeQJapfthBYiT
	YrhTRH0RQaX8SSHVkGkEkxejxl/BBm5S6lsFj5P5qglHxBeGi5Xv0lqNDUMHzibt
	s5N6wcrj5CMdinja+rdjD4LDxLyru/fWNspChlziO266hWTb72phsGGhm5NWIFiH
	+9iGe5MpDxVR/Mfis125UUb1pWtrZiilhPEbh114mL5R1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhwb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 11:53:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a32bf024cso43433186d6.2
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 03:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767959618; x=1768564418; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0S78E4OCVBcJXBS+O04kVMmir0HjoOABblyWwGQPnI0=;
        b=bkWVerxgcERzc4Al2Hhf/+bC8S43PUovrD80Sgx2ktvHHC1ZUt2h32hiv+vetTfZEf
         +cDk7DTka5S8w/IZ59XYOaZWBU8r9kwAMnYgLk59w9d0sVciQD/96+6LHF9wFf8oVJl5
         CJolYCBG7FZeKTQLWr6vX5C1U5wfyG+3AYimcYDqyGKnbX4KxxnqEh5iRe+/RTpL1t1o
         B6gAztwtl8C52YBHm5c4q/3dHI9pHjZFF8o6a8JGwCYchgG+LAhFgd9SyN0biU8/oVpI
         MgACV4l+wxlF9LPC/SBJRC+o7ZI2eE7ccz1eusLYFS2mljmtxjF7Kl7kSts2jlg93FKG
         eX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767959618; x=1768564418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S78E4OCVBcJXBS+O04kVMmir0HjoOABblyWwGQPnI0=;
        b=lgVxoh6l/TyIKrFGe3SzHM+zBv/6qPxpuGT0f3+IW0FCXwlygFg1GgJeiRVFGV0jv7
         /bJRHbNPS2YRkT0GsF51vw4K65nXFWAhDLkW7fylyiClJqWj2EZd51tghWH8/MQHU7uP
         4neYT23/hjwJyyExerqCC3ltqklqkCAUIlpy2Tj6JTbV7SgiXrUaDrhH3x16f0DpuNwD
         82fBO+BMuAqr0ptCAeDO7Ibz4wstRkA5uS9oNRDo+i+JFvKrMklf4q9Y+C1j3KaaFa6A
         zrMfcjJPbB6TEKOVV+hqqdi3rcP846+xDSfS//TmvtAeQbQPLmGA6qbXLfMqVUE9KV14
         YZLg==
X-Gm-Message-State: AOJu0Ywk7pXsML4WZJ4ovVAvtwhM0m1bFbC+8b+raMM3EscS9Hm1ByaU
	Ah1/AShMkCpdIHVyplsF6qsw7PnfW6CR6AP/G/VB3JSgMUsjF5CYPA444crBLgPTEHKch4uJWzW
	XMw6X8D0bDzFixgXU5GktvnRXNYkCUds1ItE9IXd7XZBkAGLxV7uUy0LKRjD57ZiS7dSivgo=
X-Gm-Gg: AY/fxX4hJ7CLPt7WfHF+TuEvXeqrgFCev5xaRucsx6sd9fxYciEMTLESzMZA8+nYALD
	wFqwGv3vjhRvu9ZBE27gw7OfXOJb6uj7MHnAEKnCkHmLzCBQ9Pr+ZMEcvuFjv3lI/ZjqDHKEiN1
	dh+HafsZuLRUkYddT5/QUIDd7x6m55fR4XmJoRFGeimiQwCZYAgkk3et9eWYX+FqipIb1Q2EfVU
	xQ6BWRn6F2YFiv7RGlpU5pbUSDNhNpJw54xpnHYKXyuTRUMI6J/nhJZ8/m151LJIVT/WwZtIMZ1
	8nCfEluRARrNzsKT0uTnCUd45cQFPw0a8kaJSY8/Jrskg0QF5tadbwD3RTX6dVuUgCJ8WjFRrjS
	S88EObSPX0r3FxQqDw1UlipTzarmBmhGZl9LE9ygiGQFKmQtjshlHpZ6RPo0w3x+9GI8/k3OdTA
	ifshovwwxjqo3I5wTBNWvIjg4=
X-Received: by 2002:a05:6214:590f:b0:888:3d1e:f95 with SMTP id 6a1803df08f44-8908426ac55mr128624776d6.32.1767959618070;
        Fri, 09 Jan 2026 03:53:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv5eNNc0Te2ExgoMxnTnLZpivCOtdI/VPfjZWlzN8XVc8kt45C/xrn5crvvWoixBYqo97WWQ==
X-Received: by 2002:a05:6214:590f:b0:888:3d1e:f95 with SMTP id 6a1803df08f44-8908426ac55mr128624576d6.32.1767959617591;
        Fri, 09 Jan 2026 03:53:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b7d1ae8e8sm599794e87.6.2026.01.09.03.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:53:36 -0800 (PST)
Date: Fri, 9 Jan 2026 13:53:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <lommxush223zqhanhyewajaf3lrnaw2gp2sbtp2nsl7stlz2f5@y6eqahqtmlm7>
References: <62282860-1319-4d71-b917-51a51f37d75d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62282860-1319-4d71-b917-51a51f37d75d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960ec43 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=JFU61sxo7Fo2N6hwkwIA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: cNo0P83WVga-Ocm9B3GRZ8TppqEhlPSJ
X-Proofpoint-ORIG-GUID: cNo0P83WVga-Ocm9B3GRZ8TppqEhlPSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NyBTYWx0ZWRfX1o/n5ZF3mIXB
 0sT3YFCdWPFXE7hxO+g/Lvj+RDbKHR6xEBgOqP+HViiAEpVncS9TkAACNS0osqzngUgbUbxcWez
 2gXpy6f1MzI0FXkALAQsufb4rH40pdGa2V7hiMm2Gmmklre0tanuJXIsQ1nsbN4CiuSk/DLVZ+v
 jXQnBdmwA2MUgbNQwiRmAs0GM5xdkVAR03LSeM99bzod2/I2GfTjPOEdeycNFGAqGNcBYdNoRvR
 5uVPQKXC/GK73iQXScy349HG/qWsa4YtpNvZjEeHF4p00Zv+MEJ9Ho4C1wkbMSy6QoZEW2/o7PV
 jHj94KyqkFOA+Zf6crBdr/LFjTh5CR1jdBJmNzSnNukMcqx2rYLM+fdy7L6nfGHWnYaC0GKOFLS
 5f4FJvgYT9wWNxKQqR0WywKXlBz3NETg64GrC2KegcQ4IX0nVo2YMCmq14i1V7DvJpE8oWgFh5R
 vXJodv5KsdVJpnE04Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090087

On Fri, Jan 09, 2026 at 11:15:28AM +0530, Venkata Kota wrote:
> The following changes since commit 9e2418490ba10d9c5dd58fcb56702b687639b211:
> 
>   Merge branch 'intel/xe3p_lpd_dmc' into 'main' (2026-01-09 00:49:42 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-lemans
> 
> for you to fetch changes up to a5cdffa580e8e6e4a098f6a73b803946ee9f1df1:
> 
>   qcom: Update DSP firmware for sa8775 platform (2026-01-09 11:11:10 +0530)

I think, you forgot to git push it. I don't see it in the repo.

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for sa8775 platform
> 
>  WHENCE                  |  10 +++++-----
>  qcom/sa8775p/adsp.mbn   | Bin 6692864 -> 6795264 bytes
>  qcom/sa8775p/cdsp0.mbn  | Bin 3084288 -> 3162112 bytes
>  qcom/sa8775p/cdsp1.mbn  | Bin 3084288 -> 3162112 bytes
>  qcom/sa8775p/gpdsp0.mbn | Bin 5881856 -> 5992448 bytes
>  qcom/sa8775p/gpdsp1.mbn | Bin 5853184 -> 5959680 bytes
>  6 files changed, 5 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry
