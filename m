Return-Path: <SRS0=pPjC=CV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E933F55811
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2026 11:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08D00C2BCB7; Wed, 22 Apr 2026 11:22:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B2ABC2BCB6
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B2ABC2BCB6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98qOr1442597
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 11:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wfp6BzbiufLN3AIvdoeEdV25
	VsOkc93Ga4MRSy1QB3o=; b=GKb+5xpxOrUwLPrGI1qWCABI5CBcFu+NmttFu24S
	+wNI4Hi/gVrhRrjnO6p/Z/Kz5GDYGgTeTD/loOY5YV/YCNtr/JAwmVP0qT0lXfMh
	5fujZS86FZWCEOqJGep0xof3v7sBcBF3INyO9J8PQrP6cJWzW5kfqu7n4VrNXtQF
	LmQYev5ETT103ZtAllLU6BpxC2st6kGziHnM6hi9rhfJe/i1Jzr26jQ3Ii/LQrc8
	jHR7R85EPAoZ8Ae8ExgLvoiuy4Y2fhS0fZGwxsjDlLsrpHnjfKjkAVhyK2F9Tto+
	672yCcUwaAmgUw49h4HOvb/3jQR7v/uaJA9b93bMBU/w4A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu1qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 11:22:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so5900901a91.0
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 04:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776856938; cv=none;
        d=google.com; s=arc-20240605;
        b=OXE+s5GNK/MOghpr9OJvh7nqmb+BraywkIfP/0WW/hofAg1Xah3/hC73GTctM2HenR
         BW3va4yZ6AXqC2S5+uJswnTO2oG5CbVCe/dTCiMnkpkNlWug+LQYRG3M00MLrNdJP+tU
         gfrhppuZu3qPiFDT4NJs1H43e94JV0sY96jxGelpAYqxqPEbohhulE3I35lSFe6sJVOf
         v08WEAHaji6Nl29xJXBnM0SXf5PyRmWhrCA9M02ktwRF5NqFw2kwsPwCe/O8pkQ9V5v7
         Wi1Mg/OsGiREnKhiaT1xQpvGOqRNThi+R16THt7+B8oNsDrRXBfEFfHWs11TQrVgf0Hv
         46uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wfp6BzbiufLN3AIvdoeEdV25VsOkc93Ga4MRSy1QB3o=;
        fh=62tZUuFD8zmC58yWj84f/RiwrEkU9WJ4Vdk6NLs/W/0=;
        b=J6gTa6OcTPL1/gkAk/UrLOcFHITuNtLhoCNa9IA0Mcas0p2MLYKpEioLTIzg78k32a
         C4d8KfPLU4sS5QpaHmJnJfDO2nVLroafP5P/z5NeCz9AGkrgM684UQglSLQXkgPSrUCn
         Kxhs4CHs8BxNPfnMvVo4CnfDz7YmKmzmkSU6isn7H3zKQ8jCM1ueI0cvuy4Iysz1/s63
         lAXsJdM4XqkZTMfRyyggtFo3sEZDxYQz1h2yDsAGxQJpCXuqQ+pHloAlzx7UcUH1pt8w
         tGV6t65hiUT01mVx1sVuUTrnWp+mIi8WLmEeVxQYMu8QSIasTdI/syDeJaXFQtWq1L7Y
         uRNQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856938; x=1777461738; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfp6BzbiufLN3AIvdoeEdV25VsOkc93Ga4MRSy1QB3o=;
        b=Azy7DTiU+ZL5sUWXVXkZOpw27TPIG6oFafBd3H1mhv0zMoLQjmtqSQIg8XmZe29u6w
         VCCNUJQ6om+QrgNQcq/e0ckEFoTfBxIg436OhqSJ76sgWHO+DyHuvwYYw6G1AcKQBv1T
         fTqQnHwETnZMcBFvjo3X4ikqsvtdUwsJ2sDc1KsWXDfdR2sajcGpnST1toZJkSRtx6rw
         iS0lIgHn5AweWGcpXXjBvoUM5kQ/Ad5CrfiG5lo1OYbgoNgCRX4A6+CBVudonowi11qP
         oO1arjbWTHbstAFMqeszGU1h8zd8FrppOmahVnW7mgPIlSzy1kS9uwI8Uc0gjtlg+WWt
         97CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856938; x=1777461738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfp6BzbiufLN3AIvdoeEdV25VsOkc93Ga4MRSy1QB3o=;
        b=iP4zvRl321WsxhYnS+RuSOI0ZNgeeJpipZOVsywBO8FJV/smVotM7uHR7XI4ZNDrQV
         hjYiyqRDYMd59L8M88yC75UPy1EySUd6LiGlhgG8HnbXmG36sZOY2RjNj4aHrwesZhAr
         oUxh89W6LWMUrm7vYgWJOQxirQNC9mA21UDEw1QXgEMFWpeRujTlCICYA9iwwpRGkEsu
         PQEnMivHwqJ+dBFTXp1Y3BypQLWSmM0e08hN+C3Yc8miFECkHE02cDulOKVETUenZ6qA
         AsHJShVTGB0m8KTXDjSt/WldHb8GZmXPfRWhkfRIz8Tjxcm8ovbQnkR/zn36BDT0FfUu
         leEw==
X-Gm-Message-State: AOJu0YwGtUjWPz9022ORUD73qALXld3woFqecUClEjGn6cxErkKVulDd
	INEaJcH+AQvNJidg9bP2Wwovtj0wOWVnuiu6E5nBIiks08Lxw6jDM/rkXvh7fgLeEn0CzWoSuic
	TrfLyGxmxhekKBwfFnZ8nAvNiSmwBmQrYR9xYgpn5rrjI+zOYn2GY7aOg8muF8aPWwalJfOOBjt
	84I9JrEldoIwlxTlr6ELgBSwgWgK/vmsGXP2lg7Q==
X-Gm-Gg: AeBDieuQiz2HYDypw1UqZ3NMzdKp9nVaERTKl+R6KsYeXa0qugNNlYTM6WBo6U5w5NZ
	l7ti72HqYtsYjzJw8PPj+qAaB67K3WHAVREijuV59Nlk5vMbRCL7fyj2l3FLZnOspYy5nNA0bs3
	4SpOSH0spsTWDY2LG3RNrGsgtdjff9duB5WZfuHcPewpgVYcwOBjCCmYnAVZh+H/ovBjZM3Cspn
	PAHLR0V6weum/utxA==
X-Received: by 2002:a17:90b:52cf:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-361402edcc2mr15507884a91.12.1776856938505;
        Wed, 22 Apr 2026 04:22:18 -0700 (PDT)
X-Received: by 2002:a17:90b:52cf:b0:35f:b9f1:fded with SMTP id
 98e67ed59e1d1-361402edcc2mr15507851a91.12.1776856938051; Wed, 22 Apr 2026
 04:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <46b3e445-55d1-44e5-bfeb-061584b6b37a@oss.qualcomm.com>
In-Reply-To: <46b3e445-55d1-44e5-bfeb-061584b6b37a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:22:06 +0300
X-Gm-Features: AQROBzBiykaVQiY3OJx4a6zfFhTRldMGwmQ3m3YhxarsT1Cu3zAq4I3TDog12bg
Message-ID: <CAO9ioeXPhMQ9tv24XoyaKsexamJssYKm3R2hQk1KfTpQjQxW8w@mail.gmail.com>
Subject: Re: qcom: Add gpdspr.jsn for qcs8300 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: -rb1HoqfPlr0s2qsm7kQCqMpk2dahkZR
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8af6b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=vYdTm-oAuvNEMtQElhMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOSBTYWx0ZWRfX0mFK4b2sxnhx
 u8sI67vt4cqEtx0qtXRJJAv/mPCbALsASNtCZNH8KyClBNiYs6kslgXFSkgnJGlpVKuh1ES1CL0
 cEbADWNlavfpPUXF1J5wFe8z7goHdUW8yaCHgMJ07FvIUl87ybnoArSGT+WNwyqTLWccxTDnVfy
 Htf2lGP4s93ERID8NclngYfIYD8xWayK/LSeF0haRfDFCeOJHPUlvwqZfImFdPdw3Gw3tA1k32L
 jjerBUKVMKTbDncXbSJ2PsPOse/j4rNlKC0CvkL0oiSt2rY+KUSwvqlDnSabgFpPKJ0Ybk3Vzd6
 ycPtnMN9YaQs9KT1xNUuQyj1jmpGg5jsq+SS9oaS7RQS9pbeSAUbI2CqQMnC2y/6PmNPDxpwuai
 5N9OLGqPjWslP4copLrTci/Ht8FSubmAVUE8xE7nnKwwBVbPn3e7k7GZpOOMJWRvLOyliXAARfi
 w7JswybLnJ30aIAjS/A==
X-Proofpoint-ORIG-GUID: -rb1HoqfPlr0s2qsm7kQCqMpk2dahkZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220109

On Wed, 22 Apr 2026 at 13:31, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
>
>    Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-monaco
>
> for you to fetch changes up to 8d12de14b0ba826ee03b0bcc76753630be32f43f:
>
>    qcom: Add gpdspr.jsn for qcs8300 platform (2026-04-22 15:50:51 +0530)
>
> ----------------------------------------------------------------
> Venkata Kota (1):
>        qcom: Add gpdspr.jsn for qcs8300 platform

Thanks!

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1012

>
>   WHENCE                  |  1 +
>   qcom/qcs8300/gpdspr.jsn | 22 ++++++++++++++++++++++
>   2 files changed, 23 insertions(+)
>   create mode 100644 qcom/qcs8300/gpdspr.jsn



-- 
With best wishes
Dmitry
