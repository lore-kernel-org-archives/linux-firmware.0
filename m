Return-Path: <SRS0=hVxm=C2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3937DFF8860
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Apr 2026 14:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0711BC2BCB4; Mon, 27 Apr 2026 14:51:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34B42C19425
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 14:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34B42C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63REn4jf3825438
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 14:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J3Xg482+WXCZhPKHnpJl+0Et
	VKqDrRvrQJLLYeN9hSI=; b=H32puF46jYjck24NMIbw5eqxMpYMLwiCInDrdPmn
	DgnTQh0xmAE2vLP5/rioxfD4BAEt+Gc/1HpcWk4NLll5QVAISuBYDc/w1N+FaPXb
	6oHMmP5b2kByFqZsf/1M78+QeNr70SchvO5A8VXw/gw5HtRkBBTBQy25iDmOpknt
	h/qRUKLDYf4c0VlZD8AiaOqagFwfNUdEdt4G/OD8IN5J4mSv2LncYgx/jLtYdsAr
	8WhszNrXRgizmJFK4rZ4axqnGbknCf2EyE82QSjfQ5jn25MVPo6xFWyxccJJ7Z9A
	V8Ke5RPMr2qyF2c3xJX3S3+r3QWnjDk77zb2/bJDak+klw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5551824-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 14:51:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fae95c82cso185075371cf.2
        for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777301489; x=1777906289; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3Xg482+WXCZhPKHnpJl+0EtVKqDrRvrQJLLYeN9hSI=;
        b=ChgI5eh8jfXJzx5WQr/3T40vIuir0IRtjSdSUGi9ITeXDxdw5jhZ23QeEcD507C3/G
         rom6o8iyvsktsTUSs2obfNKQ4ZpCrmjkAiCuDYCNEEvXfUAQQpq4McvW8DhFgefAKX25
         b994hofhgd3/sH1qP6w0qAZVu3FG0QUruFT+fbPIqvxY/Xmze0/mwqm4O2irbgAVlJy7
         +9oTSMEoQ0Dudcb+Yy8aQTa3zjzEYMAV7dydiyRCfeieUoKPeMJ3IZUS2cZ8wtAf/pdR
         eXgXZ4Q/dBqUnOYyYK7MoWDdi+9FT2AHsSALo/bolG2MDltlcRxHJ7cMO74zdecGEEIZ
         i33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301489; x=1777906289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3Xg482+WXCZhPKHnpJl+0EtVKqDrRvrQJLLYeN9hSI=;
        b=hmBa8ALO20ZhDDFHV3JyYhxiyjCEnO6Wy+a6wEnMrnZp1hhUUUqXWNlKUFkkEqzOU0
         ss/gz/e6k7Mf4krODWFBm2xjxZ2TRYKysv0XJVyw+CsDjcrD+Vbe5nnH7pb9PUhEZSYI
         1zxopjQyTFZvYPE9lgS5oM0v0kUGr0JNHRZgY+T/fD5H+Vm95ewpTmrM7gBcU/IYWimC
         B0Jj52opvsltLizYdFNThw/Zt0hxj8fpc7GaEkQk7rBcy5DfyFdGKmg3OMD8wictQuvJ
         +8NbEP38b2F5FXh2hK8t8JXO4lGVgQppWuS8GB0ZMMbX1Kl9dEw2SygZcJCyyI79LN/M
         xovg==
X-Gm-Message-State: AOJu0Ywc33OtIvwzRjF7fCwVm65YBB21cZYUGiAIE4rqcJz5MgFYaNL3
	WKrzEqT39usmx9ciMpFiBBg3VUG6caoIlp4ykvWVzQeh7+O6msKHzKGDpsfJ2jud3Sv1yWe7EwA
	LehRJ3axbSB7gWl2diuVpoOq/Uh4acozpu7TNRrYm5Hk0duJB/fTCT+ANDDYOnvw=
X-Gm-Gg: AeBDieu7VK7qmbmW6hZhRyzdIVrc485lzcFLVpndigA8pmcQv9jOfflVnVkxfWvqz1K
	5TSBUZOiG2lwjk/ZczcHEF0Yy6lIYqHAu85mqdAjZzYSf+FlpSKxDi/3FLgoWMTKwqs23N7bxT+
	FEnsMVhSVdB+kdpQXbrvfif7m7rm61ms0KpdtDJOpj+AN8ESTOEd4/HvYu+HntXFC6oEq6rylHI
	svHUM0Zm04U9vtoBiqTQOl+L4GD//h/U8/eh135vZX7rYVi5V/x7kTn6/6Avv6+y0IAn7NYJEoa
	WddzBj3oYyxyd7zLisUgbaUoU/S20OcDxxpab9T8zKP0hNcHcQByz4iRBuwypCjoYDplc+Pkq4b
	oqCWl0rNGHt/gk3hbKfBYj3XFY1OytKNGtkWtCdvpu7S7RSvO9f89RYVVmzmmkGQn1keGuJKcHj
	K2zLSbU/H+1pO4i+RrXrwHUjvI8XMz9QrRaMb5K9UeFupKgQ==
X-Received: by 2002:a05:622a:506:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50e36827766mr632698891cf.7.1777301489159;
        Mon, 27 Apr 2026 07:51:29 -0700 (PDT)
X-Received: by 2002:a05:622a:506:b0:50d:86cb:db75 with SMTP id d75a77b69052e-50e36827766mr632698441cf.7.1777301488574;
        Mon, 27 Apr 2026 07:51:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad30asm8387329e87.16.2026.04.27.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:51:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:51:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: add Gen2 firmware binary for Agatti
Message-ID: <zw273obqsg73ott5tossnt623towqyl4aoqic4bcqeidbwjgzw@pyqkvyk6eszh>
References: <dc0e70be-70ff-8638-5a9b-9fedb7a6aaa8@oss.qualcomm.com>
 <2188dbb0-e8f9-1ae2-2987-8185276d1e1f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2188dbb0-e8f9-1ae2-2987-8185276d1e1f@oss.qualcomm.com>
X-Proofpoint-GUID: 53J-Qa6zqpKvy769uvXwYjqK66PxG2En
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef77f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=EpuJRo11d4ecvSuW0AoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1NyBTYWx0ZWRfX12e0wL4Ibwyy
 hg7NfgbZGQmg1NGd77PFJsn/4brGhSC+YoSRyXJiFmyVr+ZVGb0/mFvEbpBkNKi+HQCDuMBZu86
 SGUgVQpxM35b9tgrQ7PWpdk1mUG5KiTh1lkimowVBuElCTy1ao5dNa3bwNWKHopIhvO6Z7spubX
 Ifg5OxlkyBozkp27XiCbHEjeqQXUmsvk/6nPh/5CJWDD04Ys6GFvLvFbp6JwuX2gozyXJV/rcy9
 4g0YzB9x+CRhxscZFnp4Wtz4LGMv/QCe/Aqw5FG5LCYOF0qvAc5bcaCCjgNtjzcFv8THkE4i5sT
 9Z4TQ5XL/u/KyOKqPoRY0lBEZTbm5/PO/eNCkfFFDZq9iMAwDtmrYMQ0/DvAOmvHaXbGYYFQUQq
 qcRSpI7dfT/uQtWRoYRwlWf3YO+318YjmiZRz5maq/GdzPfKcstQzmZtncBBkXZRUihFXHWJ5xF
 Dg5WdRFQ+l+DK8ZU5Vw==
X-Proofpoint-ORIG-GUID: 53J-Qa6zqpKvy769uvXwYjqK66PxG2En
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270157

On Mon, Apr 27, 2026 at 03:43:27PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> Please ignore this request, some change was missed in this.
> I would raise another PR. Sorry for spam.

I almost clicked the "merge" button when I saw your message. Thanks.
I'll mark as not suitable for merging.

> 
> Thanks,
> Dikshita
> 
> On 4/27/2026 3:30 PM, Dikshita Agarwal wrote:
> > Hi,
> > 
> > The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
> > 
> >   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > video-fw-Agatti-Gen2
> > 
> > for you to fetch changes up to 0d5d45c00868c21cc5cd1d21adf8afd7a73a91ef:
> > 
> >   qcom: vpu: add Gen2 firmware binary for Agatti (2026-04-24 15:24:14 +0530)
> > 
> > ----------------------------------------------------------------
> > Dikshita Agarwal (1):
> >       qcom: vpu: add Gen2 firmware binary for Agatti
> > 
> >  WHENCE                         |   4 ++++
> >  qcom/vpu/ar50lt_p1_gen2_s6.mbn | Bin 0 -> 1861732 bytes
> >  2 files changed, 4 insertions(+)
> >  create mode 100644 qcom/vpu/ar50lt_p1_gen2_s6.mbn
> > 
> > 
> > Thanks,
> > Dikshita

-- 
With best wishes
Dmitry
