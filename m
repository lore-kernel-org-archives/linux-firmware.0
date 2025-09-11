Return-Path: <SRS0=Dfku=3W=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A92CAC58D
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Sep 2025 11:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45FD6C4CEF1; Thu, 11 Sep 2025 11:57:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CFECC4CEF0
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CFECC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BATI6l007257
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DlON+B4qoP8Z0jLWuwkc27/Q
	ZeOkN4Z3Ar5kHL0Npc0=; b=LVMCmAaYWHHqDFSdXw5Mi/qeArqfHzO/Peki8bcz
	13uWWqxlQOq7634SbfYsxfT5i5lR3JcbCvpAQhjys/Z67Zds6Q1sKXl510Kx1j0z
	e+IjCU+hXGlHE3Y6I3Rq4ewVGRuRuJy69TofmRyIKn0meLlZwv3rK3Zh9yAom5ZZ
	lTiT3BtZF4CtVGjSEOjifdHcj6gIcILAoC1v/dCxAvXYKdLI5EERyGNIHGkeBplD
	zLdBMeq4FYagZr2QSQ7hO3h+WT9enVAHFPGbP/9VBXunl2ZcO6NDAbyBX32N+XEg
	b5LKXYKdKhOc1md63l06dlDrrXg8fX6XRP4BFNMsbPdRVQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afetv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 11:57:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-720408622c3so11730196d6.0
        for <linux-firmware@kernel.org>; Thu, 11 Sep 2025 04:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757591830; x=1758196630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlON+B4qoP8Z0jLWuwkc27/QZeOkN4Z3Ar5kHL0Npc0=;
        b=ClIVepQAkY3CGLwJgDFunlaQHXAtqdZc74DJ+VXq1tBzlestLf6rcqB+0jNFFElR6w
         4W6rP2aM2Y2FhWlMQoPSl021U+bOFZ7Me2M4RQ6xxvxMSi5iOn8AZxZHGwogG5UzDSFa
         DViI5B23D9plgur1UZqravC56WMVOEFGivRIOEzUf7lcmRXGdBQtY35hEsOHz3ubXX86
         CfhvhBpkZK2H/Lo3jR/fMkkFjkAzxqqAjxEO8ApOGnIfC5ODX0U8dcl1Tq59L8C8h8HG
         84fCgpEd0SJRXaNfXGZJ50iAxczQztx4DdG5cOQSS5JZtCtE1j3UR9s2iJgrn00Jb6eQ
         hBFw==
X-Gm-Message-State: AOJu0YyDuNMuVtokzDEXZG229tOisr5x9ZmTlyKuL1GUGraK3EemVrs7
	FJAvGHzmoxxDJdNu+13hR1l7Ymn1fwQ1XH6IZ4LhaGnQ9QAzqW/0T1R5rVpJnBK61BpF4HCzhDm
	Rl6ylWDluu+Z/BKWiu2HBQMiRr0IVYDzsLwiKenjsaziUsvD3h4TsIouZCBRKCUU=
X-Gm-Gg: ASbGncvwwBlkSjCsEkHSsQy73aBO14WUWjh/MCFExblnsOeVl7I9aGX2JCm1JzRCWOS
	4X7WyfigjRVYfGniDnr+5v2EA+3kATUQoiYQqwZDkNZ5wRWvbT7j+JGJ1Ci7CHD7A4S3DH+tPFC
	uGzQWo0halcD90EDxSltVIfpJT7KcoVVtxX8FvO1b3Yfx3KO3xRpdLeUkglLq65piQVOUgvRFdG
	M+/RNgBXdNf6uh5+fa01ydZ+uFO+QUYI+5XmwQUv065BL4hxXw0Zwxs6AZnXlJnhskW1xAC281T
	l1OReqO4+kHtnbk9VP/9uctpw1A0AMCTyCN+Yvf79ZghF7FACa7TQ+XgtQKpllbjoES8Sg+OJMT
	40ME8AwumBQc04nEMw88FYTswBW8Sax9CKFwF891UxzEMuISjtVWm
X-Received: by 2002:a05:6214:212c:b0:736:bfb9:b283 with SMTP id 6a1803df08f44-7391f9b793emr214786066d6.11.1757591829597;
        Thu, 11 Sep 2025 04:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVJp2bzEHfnWOuZkKWm4ZOe+p0Po9kxTC0ZoMy7q0I11+pHc/4h6KW6QJmDx/KktJcimqooA==
X-Received: by 2002:a05:6214:212c:b0:736:bfb9:b283 with SMTP id 6a1803df08f44-7391f9b793emr214785806d6.11.1757591829017;
        Thu, 11 Sep 2025 04:57:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5cf300b7sm384446e87.45.2025.09.11.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:57:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 14:57:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <xopfgtlzht3l2clqwydghyzckpub3brocmwvclchbi5gigst3h@plhqa3gpdire>
References: <bc6d5804-1967-4b59-8de8-17e8bc2313cf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc6d5804-1967-4b59-8de8-17e8bc2313cf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2b917 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=2xxelfnc0pNzmk0sf7UA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: -DACLGeSlPut55F6tFyinmhNqLPYBHaN
X-Proofpoint-ORIG-GUID: -DACLGeSlPut55F6tFyinmhNqLPYBHaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1EkX1QpqHeuX
 RlcrxiYaBy+ZwsVCcQ0GDoOzj0PYd9bCAzzDJJXMPUOB6bcl6ho3guxZka1dlkNz1aFjo1gQSLf
 gXCdD950NpBAxFIdcZRDu07D7ggWJ0ojnaZJMTLJpDEAysYKpvLYzFge5yx58xnxlMMzRCRgT7Y
 kuTaOjf8r5zDlfme+uwNI67NOvmPDJ7WYWnLSNaOGvQs84KhFQU+eqdcp9NenOxBjgeN7PJ/l4Y
 chpsCeqT/x09LgIMhNVoQD7/o/TJa5aUosSALjBJg7JX12DQDygDG9BTjBMXK8rDNqC2Dtq/4Z0
 rtC1QeMe4537tcWSN3jiVPrRg2RK2ZDKLn/kMBlEUhxWa9YTIPxTaon9JRQwACQOilF9P9MLTnK
 cYCauvwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Thu, Sep 11, 2025 at 05:04:13PM +0530, Venkata Kota wrote:
> The following changes since commit 4573c02ca0caf001c5ce5dbb62015d588258588b:
> 
>   Merge branch 'mt7922' into 'main' (2025-09-09 12:02:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300-dsp125
> 
> for you to fetch changes up to 13410ff8f90a06e2544236b13384f3068d335ac4:
> 
>   Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform
> (2025-09-11 13:28:42 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform

- Missing commit message.
- Subject doesn't start with qcom: prefix.
- It should be 'DSP' rather than 'dsp'.
- Rogue doublespace in the subject.
- You've added a bunch of files, but didn't mention them in the WHENCE
  file.
- As far as I remember, GPDSP1 isn't present on QCS8300.
- Adding audio_pd to the GPDSP needs at least some explanation (in the
  commit message).

> 
>  WHENCE                   |   6 +++---
>  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3092480 bytes
>  qcom/qcs8300/gpdsp1.mbn  | Bin 0 -> 5844992 bytes
>  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>  6 files changed, 54 insertions(+), 3 deletions(-)
>  create mode 100644 qcom/qcs8300/gpdsp1.mbn
>  create mode 100644 qcom/qcs8300/gpdspr.jsn
>  create mode 100644 qcom/qcs8300/gpdspua.jsn

-- 
With best wishes
Dmitry
