Return-Path: <SRS0=5RM6=3O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3022CCA1009
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 10:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AD69C4CEF7; Wed,  3 Sep 2025 10:28:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E6F9C4CEF1
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 10:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E6F9C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832x992021297
	for <linux-firmware@kernel.org>; Wed, 3 Sep 2025 10:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HIchCT2i5v4dYsvhjZb0hQwv
	F59YYo1NLQucLlLSotc=; b=NVj5YThxSWIuD+z+o8SkI7uqX19oR0TBvcB6LQ0z
	EuQk/TjWQGbruTNNDJyZqnRO+ECc2wlwkdV1A6UZ245ELi4CUctjDdje+swa9lA1
	Qh4YJMe8vqncf/BY/thjMogzq9HvmyOEcCuBDLMbeUqQKDfNravnFfaHPDQ/xhk9
	2kxM2nKn2bsGR6lpRRZqLCBrl77JaU0oX7JqpAdb7g4l8kpPVIswp6VuS1m0Ce8W
	G/l86C4gc2ZYgzRBpHJDxRKn+eGmiemnGcl8z34zgvdDiq3a12pKFT4Og9KkjbPe
	762G/a4fGQ6F+F4pcQESlrLq128XTG2TFf5hPT7SDXks1g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s39uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 10:28:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfd87a495so114875416d6.3
        for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 03:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895283; x=1757500083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIchCT2i5v4dYsvhjZb0hQwvF59YYo1NLQucLlLSotc=;
        b=WqG2y+uDkyzD56ftjbcNWhzE5YZEJdbMg+5BEbMjZeqp/mXYdWlSpMdiwjvAqtSgBt
         sdBT2W9Q6V6c28El3UC8ZMdJfrf7LPZUtQE+mYFUWoVd0nm/UY/cxLQkYTH54uw6W/JZ
         tQTE3rSODJujAIDK6JPQXBZbuxFQse0BVkVRh+xkjERVPfeZIRBHYFvFxbjvVJb9q6E8
         RoRWCC5tLlTm/Uha0SFGUANtyAJ7RFF9efGJ1QG7QVKtdNp/0sfMFkSZDmOw59nsdCFw
         O3oR2aDBd1RNMrNK0JPBAgW7I+MffL2G4ovGbk9/XHoPNOS72LKZ8zh9CMPwZ9r0xWAm
         fgFQ==
X-Gm-Message-State: AOJu0YzCvJRXN6TBcRxj74849OFwycAW/wJIqujkuciQ2RRQC6JWBMFM
	g74HJzGGXjI3vu4dOCvF8wF39UOhYli3vQm8swuHXPKS6L5TIjfVCopfdVXfQ5b2NIG08z4x3JM
	Dtc29axSPAPhje0VnZJ85pjX91HNOXSlyAFQI7hqAHNJG/bRvuteBTteWZr+Sa5Ztj49zx60=
X-Gm-Gg: ASbGnctiOp9KeZNbqlKfe65A39e+ORoRn8s2Kh5yIuQQOprEw279zRNNGfiGY0M5pCi
	neLz2DJkJ/P89U1L7SNMzEoH4nhodfkv1+Qx+eNAy8ojqgkif3qmliYr8sYEOjp6bmQlEg0hSrV
	e44QHQBIdWB6EKjlG9GXz2pwED9YufcsQOTWbYmSTpRwt39IQZ75sYthl9InCynMvGOBRrTc8ND
	QdoUoH8cT7pMO/7RNDTt54suVNl42toHzTk1KuUaDElXTrVgjYhqL0106QXa295lR11yQr1Tjmf
	Yj/XoAyIfppmFY/nqAWzMYoT/FpywdrZn5DETPHDWdZZpB7dUuJk+LnQXmwY8rOCZDABa6iBhVa
	O6pkoj+HKtBlUvkpTFTXs8Ow8PAS5d6UytS2gRsSL4H3LZknr4zrK
X-Received: by 2002:a05:6214:cc8:b0:718:a736:e5ff with SMTP id 6a1803df08f44-718a736ea18mr113921366d6.57.1756895283029;
        Wed, 03 Sep 2025 03:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9TPzhZc6U/i8sEwC2EAluEbu1cD/cLJ2OS8y7zPXVk5Opeowd3Ge4AiV2tWViL4tN0C9HEQ==
X-Received: by 2002:a05:6214:cc8:b0:718:a736:e5ff with SMTP id 6a1803df08f44-718a736ea18mr113921136d6.57.1756895282544;
        Wed, 03 Sep 2025 03:28:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9fd1sm422627e87.83.2025.09.03.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:28:01 -0700 (PDT)
Date: Wed, 3 Sep 2025 13:27:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: update firmware binaries to fix encoder drain handling
Message-ID: <x5e4zrb5yyuwwwhx3wfv7b3yj3qqubktbswpazzc2rpgan6i4s@ccy7ori3hada>
References: <13e2d56d-6cca-3929-73a7-9faf83669759@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13e2d56d-6cca-3929-73a7-9faf83669759@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX4LsVAuHjvfXw
 a8RMtS6IzZKvj9yB+tQZghsED1z2bcA7Gx7SAeKIJUvEkm+39OOy/wZZS6wdGay5IV+wpohhoWF
 O0FhoAjUcY0Leh5rG3p8sCazW0+n2hAAVzCRA1yhKrHTDwOkFmtfcCJPfEbIpmzsOG8Qt2HgRQX
 6fgfVnR10taM7b9wkNlE2uqpgYQ8DtQvFto/0bBnrM47pO7vMdTQ1fRKLXcDytjvBUXSnTX+epa
 cbTVDVuSbRYgjLjRfLmPaQbbZA1Wx//Bk6OLdiZ39hAykgfuFZb70ri/DRkm4VJVjVR8wPMWf3a
 NexDiMWhYildg+E8fSgo9+JK1/bSPrkY18oTxH5a9UrLxoP1WO/tk6RmdriTd8WIKQTfdWqZnU1
 DBoAIT35
X-Proofpoint-GUID: zLv8PVJTCJJb7gkiCR2MrpSZ0CEW5eU8
X-Proofpoint-ORIG-GUID: zLv8PVJTCJJb7gkiCR2MrpSZ0CEW5eU8
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b81834 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=QCnRTcgquUAoPbWMzsYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Wed, Sep 03, 2025 at 03:20:08PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit c6aed39675756a72c9bce4d94f12d8feb9837950:
> 
>   Merge branch 'superm1/revert-bd28704ab16eb880acbd38c597c54314e7745814'
> into 'main' (2025-09-02 16:13:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> vpu.3.1-encoder-fixes
> 
> for you to fetch changes up to 514c9017fcec5509bce5a575361e9b21badb54cf:
> 
>   qcom: vpu: update firmware binaries to fix encoder drain handling
> (2025-09-03 13:16:03 +0530)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
