Return-Path: <SRS0=N8LK=7R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3ABD25030
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 05:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31C1BC19422; Mon, 12 Jan 2026 05:44:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44053C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44053C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C00IKt078499
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIJovAon/Cz9lf9qwwaXZVKB
	XBR16ZB2z0KWX2TSKnI=; b=V7U0Nrba/hmQfjdXK8CFrtGJIqeS+Elb269Iiv40
	ds/q79ISEfM0kHhCYkfrPJAGZD0GNeFLIeEn+LPg9iBg0UdJ6OeW5DaCgnSRWoyY
	6m6GnMD7c9dViXRkRQ0uvA5sv0JcjF94wfCE1Y0G0d09hcSa6Vd7fLa1l7T3TkB/
	ONRgvpzjpcJlIaTbEodhiCbhOsvIpa7zZkaYZIiQH5e/xIel9tJ5a04JJOXfeOkq
	Q0lX9QiCmdrPvlcBWBWFdokGdp9zhwUKvwmvBSo2IzGYqrj/QCj2FxrVHtOYZ8ZJ
	PUCIi72bJmrqTdSjTIZcS+uADe4llsnQhiRVF3UsY0I1xg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3q2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 05:44:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso11544633a91.0
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768196654; x=1768801454; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SIJovAon/Cz9lf9qwwaXZVKBXBR16ZB2z0KWX2TSKnI=;
        b=ehfPQpl9gcFwdJDlC00Qs7cOPcty+IojsJTjhEFX7IHVrJqd+oZ8WTUix8do+w6eoY
         vd5KodxjAxQ3uV7YV3rVNuZgPn+hr3+rXyDDGZKXdjR7vl/PUAt+COURIqU7Dk9TDVXA
         WUhsVUOkfukpt0OoT03kpWkZKuA9w7CHYZwQyVxeKOw08iJHO+lI4B8yaVfr549sfq9Z
         oqxZ7BO5uOuaRyOOut9/j866p+Z2j0T8hHoU0P8fK9y6MNQ05NgNLI7YpF0RRWmZY0Qd
         ZvTYb4UbJKpmf2myJOs/2WZFgCq+2TIo/m46Kq41Z5nzMXDEUbkikf3c84Lq6ehg2Muq
         n97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196654; x=1768801454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIJovAon/Cz9lf9qwwaXZVKBXBR16ZB2z0KWX2TSKnI=;
        b=AEWcn967BWesmBiuNGaLGSIjXXLIb9/NlhN50/chfdNDrr+ZJJLUl2I8Q3e7HfqJOK
         QXdmGlwXXIbKXARlC7C0N4DCPKFfnFFehPDH8jWmdRKrGRyNDyQ8gXdHW7VJu1ahV9+/
         tjK5490MG1XU5zlQycwpIcV0ROKWrsQtlx4zXOvvErlwhCsMU5vPB3DkImSwcr1fnSCs
         8nWQ8HaowsPdRYNPLXzVTNDepzL92hQZVA1HPAAhOnNYmFCQS3bjWmv9lJh2IWVqxd7l
         ogW2+8oBVR/W1CSx3wLTWDV9gmFYxBtEjSHpzO2GPG1bVm5Kq+gmltw/0S7ZcXY3XzZY
         7caQ==
X-Gm-Message-State: AOJu0YzruRkhgev67APevRrH4fBj1H0sVSDu1iVDN3VFq1FoEEUY1XA9
	Fc/P8lGgDXnIJrUug1fsG41gGRs7VIxAZJ4D71trmS+Qy5zF3KdqhBtqa4nCwBoTD/qCNp2VWqI
	Iu/rm93fYFIZqlW1qtaVi3+fDyD4GhAbQUygkpL9qsf6QgACKVsELzRaaj4iue6wVMXRWdu7m5a
	PyeCHA/o42jSGVCfLbmIWfsc9w9hwrbMIj+iPDrIpGoUhSaK+R
X-Gm-Gg: AY/fxX71/k46FnGa3mfI+HPJORNMZJIvrKUqW4YCx4CyhLYwpvIRRTCD2Wx9k6zJa2W
	NxX0IAOCdvhSIRI40+pHDpdGn4B37GwN9z/DQT5s5w4xlP0x9vr9dF1MBM6z6cgjEz5VC8C2Uoz
	04o1Dr2HNJgwO1LCZJeRBT/F9uM2SoTtslLhYMqBMwdkJlbJXNDMiSuVcbUh4sodu+69eJXtzsD
	xHQoOOb
X-Received: by 2002:a17:90b:5848:b0:34e:5aa2:cf61 with SMTP id 98e67ed59e1d1-34f68cd6ab9mr15188929a91.28.1768196653564;
        Sun, 11 Jan 2026 21:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETGCtTpZuDbrxuchbJ00AiPU3UMBk3g3XOVH4jRyxbyRdwiz/0DRGkWE+RCgZcifeiY6FZy5/LDSbXn1ecNRk=
X-Received: by 2002:a17:90b:5848:b0:34e:5aa2:cf61 with SMTP id
 98e67ed59e1d1-34f68cd6ab9mr15188910a91.28.1768196653057; Sun, 11 Jan 2026
 21:44:13 -0800 (PST)
MIME-Version: 1.0
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
In-Reply-To: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 07:44:02 +0200
X-Gm-Features: AZwV_QjJdB4U7nIz2mwR_K0Elzc1kg0Pd62fT0zLY6ljVxI10T515gsGvSbZsZw
Message-ID: <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: TVxo63L7xOaThIdok0j1G9w0H0HrgEJo
X-Proofpoint-ORIG-GUID: TVxo63L7xOaThIdok0j1G9w0H0HrgEJo
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69648a2e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=yidT-Bpucy1aF17UIF8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0MyBTYWx0ZWRfX/o/BpHObQXHC
 iQYutu/gZIK+qxJyITV9whBGuqObypDxkVQOOz1ilXntCT0QThbOCq0CWt5XwgMd818jF9aOrdt
 2cNieZi2LIK9hu5qteOwvaaZ4pWYS5dGzv/hXZRGv3XUjQz5jQ808kujYlEltLpRnpl7HO7jLlV
 4IfYjTGJrdxoyWYghRlxygBl7Whx/k3gG7C4SvzM7WZcho3eLFU1Ojdo1XHKx1snXuYV6uyJIfW
 KXU7HWT43Qqik+yrZop8jeVHge7NCoDOJTjaDR0cdFnkIkIHICXwVGmtMWmcqT7TMGHac6it0eo
 z2C9HZNtFiTbn7L+rGtwkvcqmOANNEtLkVkEYxoFdphYTYu5Gh5KfCxz/jRJXv/3yJKK6PCsh6D
 JYukwViWMZtz7bFW6SgHWWFM9npaM9CvK+FJtsmb6ahyQcdKZjpHSfaQ2/EGtZHHFEZscvChn+B
 ZJ0bCBc/y0LhUaMYsWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120043

On Mon, 12 Jan 2026 at 07:42, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
>
>    Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-kodiak
>
> for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
>
>    qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
> +0530)
>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Update DSP firmware for QCM6490 platform
>
>   WHENCE                |   2 +-
>   qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)

"Update adsp, cdsp firmware for Qualcomm QCM6490 platform."

Where is the CDSP firmware?


-- 
With best wishes
Dmitry
