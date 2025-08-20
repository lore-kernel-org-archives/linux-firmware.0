Return-Path: <SRS0=01s9=3A=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F5ACA0EE4
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 12:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C43B1C116B1; Wed, 20 Aug 2025 12:05:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 064B2C4CEEB
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 064B2C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9fHgV011382
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 12:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QjvB4SqNpT9MzCQO8/RDg5Xv
	dTxQC0Vcc+ZIjwkTtms=; b=W7+urEWBdg+EUWRD1o5f1/EpiSxCIxWH6WxUuF2L
	y6CppEdc1RFwJSLFc2DJy8DS5Q+xSO/IPt33GO3SfEx0U5bTVzkZ3dE/35ApL9sE
	l+Tvr4qgG8M2HWrY/KQeH80IdfsPX9l7zAXGNhRNSJPGLJ7ID5EcbHxTxPygvWp8
	ROGs5d3G8UC7hMPycTG4s7ZX1HL7f7uTZGRCvSeNrq8LkYh6l6hyf9yYMFXn4ncs
	SnunOx8sJvw/4lh24boke/sjABJQr96o7gBLPjZfxb8eCYa5J7lWAeceswk2c4Kc
	IPO0OSwSLZAatKsXAUkVzll8kv0WLdgO5PD+lrSPIXMBhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhn1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 12:05:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109765d3fso19944641cf.1
        for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 05:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755691504; x=1756296304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjvB4SqNpT9MzCQO8/RDg5XvdTxQC0Vcc+ZIjwkTtms=;
        b=ei2rOYUjTeKmauWJhgufBUkEVdF1vxzS9NIslzDV3Y+6TeziilZjG54w2iojGzaVMg
         0MmoYaPS8lfQGe19b8DDnmYFQr2l81pYP/n/fP6vWEvfWYLrA9yNU7yi/JHWA9D0c9t+
         8Gm3weevgrhge33wEch5ad0ycFAW3S4zPDUzfhZ2YdIYTmxCfgzB5Q/JkdiwqaPYP6fa
         WJjEcqEoos3kSSn9ukCPQ9WgSSQG9pT7HYDu+M/ujEPyXQzazM2cxruw8F32Fk1EQhss
         +kJ9ijKhVlQZEq3g6lCsFGOQ3P7KVY+xloMan/ycujnrF/34JN2CgSi037UmPe/m1mE5
         oo7w==
X-Gm-Message-State: AOJu0YxhuhtQfwkoZsZ3pUqiYo60zspLgOdVzl359929qKqWH5toBIro
	2vdKRJseY7On1eW+ocH1r9mkw/xnxr0tOttzBhb+NiVp9B7g8EovBlrpQ/PFEm3588Q7pQZFeNa
	SYHoLV4huo57Rq6DfiWy3ARuQ28OCGA2wZt96Lt+2pUnAwi6IvAml5WZymToR4Y0=
X-Gm-Gg: ASbGncuf7VucuOGPevXCj3cRZzELdluDGUifmJzsFGgBlz1ghGBbfagp+tXx40dDtbz
	h3x0gdJcnt3X43lkqvk8/NLbRf/bGqya0dXvfZc522HaxPYsPiPbJJaiO6nSUKykKUMNgiswCOd
	0glJe42SZtmD5wnk2NReLEU3w8RNo1dr3lsNFqH78ZsI27tzz3ag3Cq1KN15d2TV/8Cc9cV/vVF
	bXqw9n/2Qv2hBMqGlpd6TzoIn8itTuboZAPpo2jvDbwDIDnaaSV8udDK+k47BwvYN3PGt0D3Rjg
	+o3UtZAiwpw/9FOhXhYAplSPEucgzpbZCcsvnZ7pdc1GysmNansXbcsUBpwyKFy68Mhpm3JtbXB
	6JrjTTg4wwVshHFzZZaRpc+uBdDmvv6mCR8qcoUxvUfEBJLVMwxXK
X-Received: by 2002:ac8:590a:0:b0:4b0:71e7:2d7e with SMTP id d75a77b69052e-4b287442e2emr65201051cf.8.1755691503554;
        Wed, 20 Aug 2025 05:05:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw70iZMHvpFWDiBuDhtr/cWUflVn1fzoHIf+/t2jEfAy9rLxekovB+8+UJ2q2TOML2EMYrrA==
X-Received: by 2002:ac8:590a:0:b0:4b0:71e7:2d7e with SMTP id d75a77b69052e-4b287442e2emr65200341cf.8.1755691502854;
        Wed, 20 Aug 2025 05:05:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f361asm2533283e87.116.2025.08.20.05.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:05:02 -0700 (PDT)
Date: Wed, 20 Aug 2025 15:04:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Add firmware binary for SM8650
Message-ID: <mwa37ubagjrmxlh7etjwlxsacrt5c455fn2no3gp6vjavnaner@gc7jwulrgen2>
References: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxzGkZUfQXzor
 5SVj0z4/xhIqZ95emI2o9GxwUUMP/0iv9mNnCF2dWVwgEMHi81KnmjQhdw4MRjC9YH/tkU8plYQ
 t/5z0mQrlChWbdKwjANigEEVV6IiDPL16BsKFPftWWry1/JBAUVPDLG6Pc4IMF4fMsSoF4P/qef
 PD6uEhYIdics9ijaK+cr7brsME7bK0JHSlgpG5b2ohnZcDawycCpkz/x8BWXVzGPEjsqjFdKa/T
 1ltmGMhd3QBiW6VyFdwrGOmVNWqrqpBzamAmcZbVcfILbRq3w3E1JXp0b8ln0u/PIxst1cusAx/
 NO+7zvKsz0HbwJDNKBeke0C05UJow+nsohSFtDvsGTe5TSMfzIIJpkMECcM5qYMFBRS28XRyFuO
 HNHofNoHHk0Uaskiwztj3+T5t8NO8g==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b9f1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=KxI43scJCH6FbBgjPBIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: HNn5-mQb1bNCK2UAvS8TxwU9UtyvbyWu
X-Proofpoint-ORIG-GUID: HNn5-mQb1bNCK2UAvS8TxwU9UtyvbyWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Wed, Aug 20, 2025 at 05:24:44PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:
> 
>   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SM8650
> 
> for you to fetch changes up to ece445af91bbee49bf0d8b23c2b99b596ae6eac7:
> 
>   qcom: Add firmware binary for SM8650. (2025-08-20 17:23:16 +0530)

Could you please make sure that VPU firmware list is sorted in the
WHENCE file? I should have cought it earlier...

> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: Add firmware binary for SM8650.
> 
>  WHENCE                |   4 ++++
>  qcom/vpu/vpu33_p4.mbn | Bin 0 -> 2343624 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu33_p4.mbn
> 
> 
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
