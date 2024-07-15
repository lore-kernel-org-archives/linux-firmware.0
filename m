Return-Path: <SRS0=hHSn=OP=quicinc.com=quic_akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AF5C3DA59
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 14:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8280C4AF0D; Mon, 15 Jul 2024 14:04:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0FAEC32782;
	Mon, 15 Jul 2024 14:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0FAEC32782
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FA7KPH031019;
	Mon, 15 Jul 2024 14:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CZY0Mzz38Hfu1jva/DOA85Tc
	A9kkdV4GIiO7U4tQ6/4=; b=nYtXY4CvrHHRWsrIEVCelA0TbJjZUJkibvCDro0U
	eqWZH5Si/+i/Jngmk1Z4Y9C8fzNhRIwgewYeIvGK2vTsLqqXAQRKWddP7F/VOwwS
	IIBV2GolgritaIPgR1weWVr4mpQnRjCVa4Rz1MbYp1sD1slsbYV8+AvrEMIib69M
	/eb5foXilCCgMsKrU59oa1UBKHb1UEj+HmKqfqSZgBd58wTBvfFN4aYkIBM1eHHa
	PGjkp442B5OZjSjE5hYVMkVOd6AmrBQmIEr8ttgphqj2XfH5v7AKYcbaZ61Qpe3V
	vaLeok8rVjF/Ofh6krAEgXD4W6bbXTE55r7ktHzNlbH+6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bjv8m86n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 14:03:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FE3vdf001893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 14:03:57 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 07:03:55 -0700
Date: Mon, 15 Jul 2024 19:33:51 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_rajeshk@quicinc.com>
Subject: Re: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC
 subdir
Message-ID: <20240715140351.olqzaiz32jpplpnx@hu-akhilpo-hyd.qualcomm.com>
References: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UsaAT72KSjqfHOKBvGsrGEN0xgnm8qJe
X-Proofpoint-GUID: UsaAT72KSjqfHOKBvGsrGEN0xgnm8qJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_08,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=812 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150111

On Mon, Jul 15, 2024 at 03:25:00PM +0300, Dmitry Baryshkov wrote:
> The ZAP shader is signed and is specific for the particular SoC. As such
> it should be put the corresponding subdir rather than the topdir.
> 
> Move it to the subdir (like all other zap.mbn files).

This need a similar change in x1e devicetree too, right? Are you
planning to send that?

-Akhil

> 
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  WHENCE                               |   2 +-
>  qcom/{ => x1e80100}/gen70500_zap.mbn | Bin
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename qcom/{ => x1e80100}/gen70500_zap.mbn (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index e4e06b966e89..b6451372a6ef 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5992,7 +5992,7 @@ File: qcom/leia_pm4_470.fw
>  File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
>  File: qcom/gen70500_gmu.bin
>  File: qcom/gen70500_sqe.fw
> -File: qcom/gen70500_zap.mbn
> +File: qcom/x1e80100/gen70500_zap.mbn
>  
>  Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>  
> diff --git a/qcom/gen70500_zap.mbn b/qcom/x1e80100/gen70500_zap.mbn
> similarity index 100%
> rename from qcom/gen70500_zap.mbn
> rename to qcom/x1e80100/gen70500_zap.mbn
> -- 
> 2.43.0
> 
