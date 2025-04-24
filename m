Return-Path: <SRS0=c9Fm=XK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29B9C369AB
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 11:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E6E7C4CEE8; Thu, 24 Apr 2025 11:18:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACC51C4CEE3
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 11:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACC51C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAQrDO008991
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 11:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n/71qC0UyzHcD5CJc3IpxFA2
	SmNjWFccbPxsDUgPJ6o=; b=iW2Ws1D4Rzk1qkzE6rttl8n/0m5vqAU3sivtoFua
	WCk1HTjbQPrE0hOlJ/yFxPjq/4Z1ABVyUYk4XW7VoLc/ZWb6fH1N2Ak9GiG+Vyha
	QdSiMr3/pq+w7GK7AOEw/PSfgEi/ZNHPFWNZwufJqOG69MnT4htPJuT/ER6yWxOm
	FZnOcaUiXrW/djkNoyih9sm4vsftTgvzyX54xfldwX5WxQbcjBXHAFIxFoPSGKFf
	HgIfdwWVlP/pVPm9VeVbkc7HLcg11Y3db/5nqoayF/uHPL5f0N7nmXQf2/WBmOrW
	sE9E433/6gv0Rs5aBr8ZpU/yB+S6c/tyl1Whok5d26UYFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3db3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 11:18:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso162880085a.1
        for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 04:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493517; x=1746098317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/71qC0UyzHcD5CJc3IpxFA2SmNjWFccbPxsDUgPJ6o=;
        b=Q8HI6Vw/QUSZ0Mv9RD1XNjM7PjSRl5zGKfTkdVGAAM//79bT6XnXBXzQUQ2BavI/36
         rw/eg+IX6R3Zpbz6O45QHWMDoKZ4LgGFqQAJ1Iu2CBq5xnhJDP7zdxJkUbeypGzFlTg+
         rT6iJGP82QPF1w7rPUhUZg02Xo6wg20FHNelK6vW2RF8baJvYhTofV+Gw6dmuWJKHWhW
         0Bcp4iDrUlbrOJUkQx1vNmQgHRTtyT9euYkuWt8qOAP2TYLIe6d2wHCMQSz7gBeY3sj4
         3R/8b93gxKFqFOHx3yMMiYhgMWgWggzKXVHDz6pBcsAtwFZdvfbQS0ocxh3qtoMv4+c3
         9w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG75ZKV89yDu12nVwdUF66iPG2QNNwqlGUs16ZbDml7XywsSBbBL0bESkfVm90L/V8tWEVSytmbear+Dwh9Q==@kernel.org
X-Gm-Message-State: AOJu0YxEms/ROm4i7pQuBLeKbckvVbXV+9Nigcl9HIcrUB+QfJ7Slgce
	id8oo97UyhWeCLD+CRRR8zWZMDwTk7FMsrYMTpJAE5ILuxjR3JbNglQ8CSykaBWapk89l443jAq
	x2U74GMZxxKuunM1BcbqRyMw0nGxA/ktoAHoUPb7eMwXi6V5bFHz4CYBbmpE=
X-Gm-Gg: ASbGnctn0OX64UF+MWHXUoPoWKHnKoBka25xOFwXQX/2o7rupStms54Gc5OpkbSAx6y
	K7nAXf/gIC1aYKMwjlWPLxfeQYsW0to0sObr9Ktxz0qUBKrKRpqSwQZ6V0nSl9KU6LSJ5k6i1Vi
	kXCPgMsqdCTyiqTY2Y0GIJ6qGy68B3ODnfQK2wPguTVrQlZNbnlqbTnqAjJQOuP1qKUmgnQ0C8+
	GCJ/kBjhwvK/02UpxmEOvfbUYfg6BynNRBPDcUKLhkAUdoi3MNlIz/EUFrWStm2KHCC70FmLqfH
	mDOLNJjl8axZnplxe3aftRFciUmkg/OZwLEl0LDtyheP7Hf3FyLQn0KVIy7dFNfbsC4HR2hWxmA
	=
X-Received: by 2002:a05:620a:394b:b0:7c7:97d7:f776 with SMTP id af79cd13be357-7c956eb34d3mr337226985a.10.1745493517429;
        Thu, 24 Apr 2025 04:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMFgkFU4f4qWykizbTUEOhAIKi1FbkAC61/Zew/sfDnI2Lmy8SoJPqAIGvKwpm1v8cy9L/uA==
X-Received: by 2002:a05:620a:394b:b0:7c7:97d7:f776 with SMTP id af79cd13be357-7c956eb34d3mr337223885a.10.1745493517053;
        Thu, 24 Apr 2025 04:18:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccaa685sm203360e87.178.2025.04.24.04.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:18:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:18:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org
Subject: Re: update video firmware binary for SA8775p
Message-ID: <6xt3dmrd6z26na7e5kqro5ws3ulbm4wop2k7wl5wt3m2fr4rql@barhdtegzw5s>
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
 <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
 <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com>
X-Proofpoint-ORIG-GUID: TsfYQ4xzMz4gHChfvO1UhZF199hD1d2R
X-Proofpoint-GUID: TsfYQ4xzMz4gHChfvO1UhZF199hD1d2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfX2eJGm2c36Jo0 xdxv8oo00UHu5S0dJWgyS1CioKgmHx4uuIaVjlD7mT/IbWK3Cb23o/5m0GLDp1311wcp+XScNJk JW5qT4zr2VYjIeb1oo0JjDMK2bjzJ5/Uak+fQyzZec5RZZk3bs/93ylG7wK5Z6Ec4g6O1VQAm6x
 A7mT/n/tflGVLlPDoROnuW5RW4RpzprAsexnLxys1+G/eUajDVMBuMhhHimZz8uycNe3z2f/xiw KWYOcq1O1fdtOH4kEqKkqyaFc4YSGq2RIbrfwJ2z6tPH4qjJJeecRwesLy2clL02/s5eSJlfeyJ MQEPypCtAzj21U5AyUjddc2DCjlglRRVvwQjE7VUT+96qQGJokHTjtb5+ksh2ZDd+5ipKMMFZwm
 PEwoZvT4Dk/2mXfRQ9nv04hi7K4FA/GgvgZPLzNuVxfkY1IRqURMhgCW10hs6u6HidOBcNNX
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a1e0e cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=gJaVLq4Kj6uc8VllTZAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=812 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240075

On Thu, Apr 24, 2025 at 04:25:06PM +0530, Vikash Garodia wrote:
> 
> On 4/24/2025 4:13 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
> >> Hi,
> >>
> >> The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:
> >>
> >>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-SA8775p-16MB
> >>
> >> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:
> >>
> >>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
> >> +0530)
> >>
> >> ----------------------------------------------------------------
> >> Dikshita Agarwal (1):
> >>       qcom: vpu: update video firmware binary for SA8775p
> >>
> >> WHENCE                        |   4 ++++
> >> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
> >> 2 files changed, 4 insertions(+)
> >> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn
> > 
> > How this is going to be used / selected?
> Once the board memory map is updated to have video PIL region as 16MB, video
> driver would switch the firmware for that board to vpu30_p4_s6_16mb.mbn.

So, by changing the DT to point either to the old one or to the new
file?

-- 
With best wishes
Dmitry
