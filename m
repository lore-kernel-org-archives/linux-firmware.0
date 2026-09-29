Return-Path: <SRS0=4qBf=HV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E7BC9832A
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 14:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 157CD1F00893; Tue, 29 Sep 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790691162;
	b=K7Zbtm+d/JbN3lceLpIhqnctwkz31kC80z+GqDS5T55rTDL4gOytuMI/uvkGj3sFPIOO
	 PEXK59dpvEuUydkJpCcEAv006Ssh4zqGLwDkmvkiY05i8ZgMw8nTIsuGVH6/3Ii1itcam
	 O2VndcfvF2bnBIuWNa32HF8h0HFDIzz/6AvrUwhTVbfHStPvidF92stnhW7MnGBP6lF4P
	 ynsJASIkYLhL81bEYP0QRXrloeUqEBvCC2JftmzKlINSnYx306ZxOQ7dRov9ZmcoCpJ3z
	 b165La1Bv4z39jZt53yHeTMmTBQB2J+cPvXYSmk8Dgi0/89eQKD6IKp9IWDDZ/e256Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790691162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o061EEbIvFG1QrhOcu2/O7/liD7VU5D+l0khPJ5zVKk=;
	b=M68ESNVeN+SjFAxNVLb2jJnw2OmDptYBzWnwY4QEvS/Lv7PgfXUWD/gDh0hSe1puSZUg
	 +T2RbSIVwleAbNoVLQijEn+HZzAoIwHy8uRIeKLKTfmdhUx8SFDD9h9/uIZWqp5pX98es
	 7HkuHu+83P7XoBjpug2vO/sHnA9JUKYMwOPv0iIpc+8CAeBCcSysNP5RgNa4XRbvXsB7K
	 JqZd4KJTCIA7rgvcg3A7g85N28ch9VpbOpqBQNKfwGq3gHJoQgRW+V05rbr7v02r+T9os
	 50+2dnvr8kMw2779dKJs0xn4ndnlYZKrwyGSFiAyGr3/TNQGXzYTgilUSOdL71XnAaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3d2Bnrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMOfhY9S;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6691B1F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 14:12:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3d2Bnrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMOfhY9S
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6691B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiUJ204966
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 14:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o061EEbIvFG1QrhOcu2/O7/l
	iD7VU5D+l0khPJ5zVKk=; b=E3d2Bnrxrl4gRSBQStTy9WK8cxx3dW+MoCnTAL2C
	YRlxgM2BSDMkeRpfeqUPsM+fGjj0tALW/mYVPpgRxN+j324y/9DM5NPygtY81rwN
	fhV2tl6Eo/mgW84TZGC2pdkZsjeEuyrskpcxy8U0aerhVl+XJYfPZkvPtMizZoMl
	dnyL0VTtcZylJXU6kmDTIxUE5oTQWl6lyI+e14PoeY5Nw7hqzs/OxjbGqCaVBl6b
	fXEZsznrNiwf0FbHnNbCFVSxd/OQFmE17YOQm2lVCJF2q4KaK9F/6Yb6KdsofPaX
	zdjicL7IxqPswRpD68rdLlP+cVD+7DUvcEw0KEAoViPgXw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144udcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 14:12:40 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c61af159so34605241.3
        for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790691159; x=1791295959; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o061EEbIvFG1QrhOcu2/O7/liD7VU5D+l0khPJ5zVKk=;
        b=XMOfhY9SgrfAYYEih+BPLp6bBdmSXAWATBDb1hKQSgse7cQykMGB+9hnntUvjMmv28
         0Wo65CPIici/oVhorMUC4wcNhMUXW/QH0b31eJ7b1QC9G2gIed9p3wu+atLKNRgHrfX2
         txcEpY4AZgupWA/KlKmMXsvRVg7/zWauYG3XAh/fzOJmwOjAvwAEbisB+u9O6vffJgFw
         JKLlDWLxqL56oTnTGL8n92hDkI2ZkIHow/NKjByBPHw+vPh+DC8gRI2iO3Nrja2gig7l
         2uOWkRJth6+H4gJU9nZUqdd4RXt4HUqWELbJx5sKGEhYsQ5CN3V/GNxy6fx6sLSfzd4U
         jxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790691159; x=1791295959;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o061EEbIvFG1QrhOcu2/O7/liD7VU5D+l0khPJ5zVKk=;
        b=1eiQr7yiS0xNdbP9Wxu5JeqLOUgKy+sYkO1G9sgj8aDbukU3o1I2iYVXpioXzidrTa
         oqIpldms2JcAwHKA8WKS8M4xrCEemqPTr76vd8RNEIMlKSRmU7P0y9yTQwJ0EX02Hf4/
         s3mDKpIWuEoQiKnwgGApoMJeKOWi5od1KSLSFvXRbTsDdP71WYdzw6yn+b3+YSgMcQ3Q
         A5h+Ht8aqfC+5e0DlTOhzBMewa5jKR256sGbXwuqS9Il4A3OBQ7VEUQYnEe9kVpR/TWS
         ZwG0gWVCfIM6cO2ihxeFjT2vVtRQs+EiWEORwaB0UYcb6+dBcYRX9/6SgrZU0fUnY29p
         BZ4g==
X-Gm-Message-State: AFq9FYJHPgpNi9EQEAwzpBL5fEhneE/B16xBSek7+ilHTM1Kj+zYFm6q
	rJu6rOk5K/zz/dJW1gH21AnISU4U082ZBNnbIFmAfU0rpQ/0BOQ/1/n3aEB8dDEVecN9gBHSesm
	QxUIMfy9/lFeWcz+C0URgHXJOJPXbqpG0bDgATfRwjrYkmF9aQ0h1PAYSEyjDMyFi2N+TJsY=
X-Gm-Gg: AYBFou1feyhvtOe1WWZuG7N9oydC6Z53/V5ap0ds8XTjHjd0mPqU70IORrIFclHG/E4
	QC1KCpMZNdmrssPYfn0ijRFN2Vx58ECY9fe4+g1l0HUrXzP9LaBf97SKILe0IA54CSNP/6UAhCl
	ctpX0+N/n1ZhuQLAmysgn1zkjmpIZPReiOKreUO7aQGd5xozVUQXB3FcYcU18TN5C8M6MlbS6We
	s8h58TxqqCZcDcqcZauMfeLpd9EKLSkgnDO6TzN41ur/YPmm7o8FGBJ2+yDn12Xqo+RX1m/yWmv
	2BuDo7n8I82AsGzLpYYtJdHN1uHH1TuRJY4X/7PknhaFJ19+Y2WYUsOLH8GLhbpCs5sRz0tW+Gx
	shnLVP0x0vmQ/wRB/ZU5KJaNqfRRTVCaNXS+Rgw1FcVl5G35jnZpYHTCdZueCpVGYr/OvZsspP1
	agRD9YdbSvNALA
X-Received: by 2002:a05:6102:3e96:b0:7a7:ad9f:53c4 with SMTP id ada2fe7eead31-7af1bf737cdmr5702149137.15.1790691159414;
        Tue, 29 Sep 2026 07:12:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3e96:b0:7a7:ad9f:53c4 with SMTP id ada2fe7eead31-7af1bf737cdmr5702127137.15.1790691158849;
        Tue, 29 Sep 2026 07:12:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580f63sm39005441fa.8.2026.09.29.07.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:12:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:12:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: add ADSP firmware for eliza platform
Message-ID: <cp447pkykeqgstg2c7efj3ftcurx2hqhwac2qlyr7j5a3morl2@wbpfkld5ekkm>
References: <5febb66a-7748-4cd6-bd29-e7d3fc480115@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5febb66a-7748-4cd6-bd29-e7d3fc480115@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX+FONLlT9/cMG
 QvwYS8vGoOb4RuqED/t8nr4MuCg1e+hjneH3E4mjW1pJWJlXFHEskQpRm1nDi/MXBNf7D2wGrAL
 k/onq6JJkb2Q7pLIq6v4K8Rv3UdfF6VeLUM14HD86nl4io+nBW0wVgsoMkGMN5aLye+iV2ZsLf1
 L4RL4ftHzxuKgEGS0aFgPHdh0Zjuv8qVJnCycxhyUS9GHvmiqgMfITtJesMoZPqFawortasmcIg
 I/9X/iU2GhCtO8b/+LaFIX0nIQ6lf5AjoKVXx25/eoAtUxMXsJG8ftxVzNlH4RDnnYqJOio6264
 t4SrVDggfT84vgbx1BSSV8QtA/NHTD579bLSWTfe6tEnbZxFb/8Os89EE6xhrXh3qSl8LXd9gPV
 3Gy3B9jtn0pC8qp5kFsQ+Us0CvSnZFMVOBj3V5rix9x1fVEk/cgy/s2XUkqbj+1ZY58JF39rAY8
 eWmSzUFG/gruED3ELWA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbc758 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=odia8E9z6z6nx5WF4dQA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: OleXYem26MsiD3i8zjZhZdRpV5TSUBPC
X-Proofpoint-GUID: OleXYem26MsiD3i8zjZhZdRpV5TSUBPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX+y/szEAAIgdc
 VDGGdIEWQDkJEDlEHroWsHcnU8QYcLC1PdUx57cMByMNn2e11mn6LAgTqN6WraMKbEZc2Zj07n2
 Th0fMV0UO+NkYPHWWKSzxcdsRA/E45g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290056

On Tue, Sep 29, 2026 at 12:19:58PM +0530, Saddam Patan wrote:
> The following changes since commit 58a9869598b606fc2e5531298932b8757292f9a0:
> 
>   Merge branch 'robot/pr-0-1790653747' into 'main' (2026-09-29 04:30:30
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-elizaadsp
> 
> for you to fetch changes up to c8efd19ed5513938026e510f727d1b45dc2a257a:
> 
>   qcom: add ADSP firmware for eliza platform (2026-09-29 12:17:57 +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1284

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: add ADSP firmware for eliza platform
> 
>  WHENCE                  |   6 ++++++
>  qcom/eliza/adsp.mbn     | Bin 0 -> 15640632 bytes
>  qcom/eliza/adsp_dtb.mbn | Bin 0 -> 151352 bytes
>  qcom/eliza/adspr.jsn    |  22 ++++++++++++++++++++++
>  qcom/eliza/adsps.jsn    |  22 ++++++++++++++++++++++
>  qcom/eliza/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>  6 files changed, 79 insertions(+)
>  create mode 100644 qcom/eliza/adsp.mbn
>  create mode 100644 qcom/eliza/adsp_dtb.mbn
>  create mode 100644 qcom/eliza/adspr.jsn
>  create mode 100644 qcom/eliza/adsps.jsn
>  create mode 100644 qcom/eliza/adspua.jsn

-- 
With best wishes
Dmitry
