Return-Path: <SRS0=rkr1=4S=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C18CCD184
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 12:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 494FBC4CEF5; Thu,  9 Oct 2025 12:29:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55C8AC4CEE7
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 12:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55C8AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EH8r029049
	for <linux-firmware@kernel.org>; Thu, 9 Oct 2025 12:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e5mAlTeGndaDbkHXPo8KCnqgBT8zj4O0IGHDwK34WfQ=; b=W29P/fX5UxrwGhlq
	p4FkOIJB5EFQG21NbsmNESNdssZ1VKp2opCZSq5QQxoKi0r1sHVY2CwRCLj5WJZU
	E3qF8pLY5q1ELce7qjz7zErkfqCZi96+czAkvdgvA6epJIyDAomRqUSrgXHjRUvT
	ZY/BG0KN0qRoZu7XhWnaPGsn3ObOrGWsUopX3anTI7TGzidpVaGpOGTdQZc00POI
	g4JX7YUGWXQVrYdK4enpcw7PjbdUEH1J5FklJotjPvildLROYu4c9A1nb6mwww9y
	K8BczkuUdosX1yvD/0wEPPEb20eMcJV/TRdqx5tcl0Q9FfWtxxGf1UsBfvLYOUM9
	c0oevQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ktrxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 12:29:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de5fe839aeso33279221cf.3
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 05:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012982; x=1760617782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5mAlTeGndaDbkHXPo8KCnqgBT8zj4O0IGHDwK34WfQ=;
        b=S4Lo4idLNGd1i9M9qlGD4q6SfVMZcVkL+PZfqzcrLTHWv5rbcuIpSHL7oulvZa7jOh
         MP8R6ozNu0CCO/hXDOUV3SruQ/AkBYzx4SkHq6UuL0F9fgrDvcmuL7qz8oajPLlTGKOQ
         k/5JwA8QcW5TgCxhpHdkaQpE/rjLTtaXvcdp6t+g4T53vxHFPCN6AWDZaCDjGKwoadbW
         CQYenRVyL0+kUvSMInVIYOdXXDkruefRJDPhbcWdfdIZzuOc18+MvVe9bZn9P57nXl1N
         ++7fHLKpayNr31q0p9D71UgNrVmBloqzZJvnlo8YoeXyPjxSLirB6fuCm4sPIyTyKFbD
         /AEg==
X-Gm-Message-State: AOJu0Yzoe2t/3PCZET/tsGpPM4za2OlOVom201QAks2QAwSvgAK7bbe6
	501p77yhRMKoH2PEOn86FIMeGb8r3GxUabWfdRiWwJ/pDIjCInQvZwIO8yQWWUHt9S9YN4If2r+
	Pgf9Ssc3+e+69gTBNSbHF9n4EJFJRfd8Qe+3dqmESmOUfIs/3aoblyW2MTZROKvY=
X-Gm-Gg: ASbGncsLBK6trFywcZZ71xHarsrNUqevhhpRMkWsAe7JFgiWP+GrGVgpOJNUawGBUcz
	j7wyQJeC8vvWI75zyea0fQfQxhInx5ZpJMX+NPybr6G4UD1miP9zRtDeBcLiirss20Hu7RefYYf
	o+nGNBE4T0r50YvQshd04Utp+GXIUFLWWauhrf2lTHSVcSMr/mzRx6aYYJospSfoEtkci7hNHiQ
	wCNicVZLLFZkrJEmCgvXcV8GlrlIbQtVAkHai6axRYgZS+gnLUS40DhYdtP/u7jgXDUpFQNaYWB
	4DTqsJ8e0z/yL2VSxbXT+WlEKCHKOz26mDXuWe0Se4fOarCBX+pFBs7tyVx44EowbTjkxIPUhe1
	ttdFyJ0xZOKH2ze5CcujQrCMaWk2k9KnhFlh+oFmVV0RNoTi0BPnWrcDMvw==
X-Received: by 2002:a05:622a:1f89:b0:4e5:6cf8:289 with SMTP id d75a77b69052e-4e6eace4d33mr88218321cf.29.1760012981962;
        Thu, 09 Oct 2025 05:29:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGvZjc2v9f9i4RU4yln+0OEaj4lm35Q3jSqVBQ4Ld15k+3HoTgqp7kzv7x5jkNpCzbq6jUwg==
X-Received: by 2002:a05:622a:1f89:b0:4e5:6cf8:289 with SMTP id d75a77b69052e-4e6eace4d33mr88218011cf.29.1760012981457;
        Thu, 09 Oct 2025 05:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b64437sm28982651fa.37.2025.10.09.05.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 05:29:40 -0700 (PDT)
Date: Thu, 9 Oct 2025 15:29:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for kaanapali platform
Message-ID: <ifd327mmlltfknamyysuuthkbxtrshgwmhnotgwslmmz6s4q47@vtd5b43opllt>
References: <66c935e2-58f7-4c6e-ad4d-77351dcf2a58@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66c935e2-58f7-4c6e-ad4d-77351dcf2a58@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX1gwhqE/wma3S
 weTP5naSB1sEumcsBg1KzQpd3Oty2+J8qjXtCtmrNx0yNjN4i/wNaVcB31y1JWk9pvqFxkkI5Dd
 6UfTZZayqaGrQ5jmgD347RMGbHIjxFhqEc0+J2V3ePK0wU7mKMLuRzXKMY+qF0qECEU3dDiz7Hu
 a1HTxNWk71HyNoaYriYnox1XvZ4JRDNj+q+8sKy+8Gcrh8SBgrja7F6cDbhzfeJSik6/FKOdxVO
 Nq3khAVrlEtVJqAbdivaAtDaohUxGcLTKervV/b+mI61/QekaT5dy1nsfDVZuJ17Uk74558tY0k
 p0aK6yHF1LOYehHXGwkU727xd9eRRW7U8rBxbqyQcPbxOX1WIZdXwusFak3Qvquy1uDG4UZS/T0
 qEqjvyAxOislFth29qsbPs0bJXZpvA==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7aab7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=QpSQzpCq_5kADxlyFXUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Wsaw20G9xjAHiRQbW7El9zxNklCjkbPl
X-Proofpoint-ORIG-GUID: Wsaw20G9xjAHiRQbW7El9zxNklCjkbPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 06:19:25PM +0800, Xin Liu wrote:
> The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:
> 
>   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> cdsp-109-knp
> 
> for you to fetch changes up to 235a4d1018bef7fb0d849a36749c910d7c95391e:
> 
>   qcom: add CDSP firmware for kaanapali platform (2025-10-09 18:05:39 +0800)
> 
> ----------------------------------------------------------------
> Xin Liu (1):
>       qcom: add CDSP firmware for kaanapali platform


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please be sure to send DSP binaries to hexagon-dsp-binaries too.

> 
>  WHENCE                      |   3 +++
>  qcom/kaanapali/cdsp.mbn     | Bin 0 -> 4956632 bytes
>  qcom/kaanapali/cdsp_dtb.mbn | Bin 0 -> 40760 bytes
>  qcom/kaanapali/cdspr.jsn    |  29 +++++++++++++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 qcom/kaanapali/cdsp.mbn
>  create mode 100644 qcom/kaanapali/cdsp_dtb.mbn
>  create mode 100644 qcom/kaanapali/cdspr.jsn
> 

-- 
With best wishes
Dmitry
