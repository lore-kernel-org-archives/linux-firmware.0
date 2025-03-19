Return-Path: <SRS0=i92K=WG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B23FC35FFA
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 15:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 607DEC4CEE4; Wed, 19 Mar 2025 15:42:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29B35C4CEE8
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 15:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29B35C4CEE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE4lrT019760
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 15:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRQCF5hhj8L1K8JhJOy6kfQr
	Ulls9qX3o3nRiZIcjr4=; b=KciS2BVM/Qd4DrnZx+oxsClYCfHDzvkDDEar1IfX
	Om++4zsRjeQkqcDwAvYZp7CAq3nTYzmP/f9EE3jc5VDKpsGUZVGpcnKnRbjyUDCz
	L5fIr/oU0TYYZJHYw9refRprBPu4EooJsWzzQK+rVovAwbL2vbVi0O6CR3Pk84DA
	cXSEAjUydphUU031YDTym5ncM8Q4LJP1T67rpRD/RP+Cv5KPWxZm59YWLN8sz3cr
	MnQFIJTx15Y6FxxaYNB07sMq2Hmu9NX3fqDFN+G2omc1ZicaKZ2Kfqj8eHdsyURt
	9T0rGeI4QvlV50596nNB7qOOPau4CO/oC6TCo9ETREQmdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu46f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 15:42:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a89afcaaso131246985a.0
        for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 08:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398946; x=1743003746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRQCF5hhj8L1K8JhJOy6kfQrUlls9qX3o3nRiZIcjr4=;
        b=UKJ79Vpd5WBV6iR4EfqSkF06c65yfpbEA3UBO0NvYKL3beIw0eU0p0YEz/fsd5zn0P
         kwCZtwPzV/L2c6oEUQ0v+Lk1gkUkJZ2u4PMpX72VcA1yKie8T9Kt5tASAW4KcKyPxF/j
         8Yhz5bfDjS9BU9r11AgtgtvNgejy/BbO+7YTzv7cEGpdOeVgcbPNYcCqNaRDWd7tNdfw
         DA8pm55/bqciCUFCjHbAW65uWnv9RpFT8nm4ZuGWw+jwgEo5pVDrJ9nI8fkPObmphbJD
         l6qyfBtUlPM6EZ7+CCivC6Dg61sLK0sUN1WaebjoTuz3gUQ1HYPL/FdhOjnNxHQyMZOg
         NUKg==
X-Gm-Message-State: AOJu0YwjVbgO1NpHikW/nmjJl0AKUZyKU8nMUR54ja4LuBf3P0bTKmsN
	qoA/spT75jTmc10Vz6e37jlFFXjAa58RCXcQOsly1ouLn3s0pHEXjkdB12LzugiV/T0gRsrMwBG
	6mTCIQQUiyDBs8TrPIvUMS48qRjn2/v6iJwHXLRFOq3kFwFdspERwMrMIOrA=
X-Gm-Gg: ASbGncvCtlSl7A51e/6PChHYBpA7k9muWvDeiYZ6zUYkKRlct7/ia29jJJ3XK8+4oEV
	fLowNzYKuJ5pfrYTthySrZ6Pe+9KquQcu9j8XxedHuoZjZhZWfgjpDhfKnhmSXtDLSunBKP2bHx
	4WH7y/UF2V36BsjaRoImhakrzkV4088TSvRnfITK9RywPjdFb1k+L9sZpBW64MMkHb5u1qmGhRt
	IGaxDfM5BBn+oIlSgKlfKstSpcHKmSZ12KzQw/xKrBC47SYdNwk28+tWwNuxixdg3CP11ufaVKU
	/M7aqexiFBWgjUtYIgu3SVFlSBm9rTgGPQwzUCo0uaHD8HCTTedJadvGb2XTkVdKs215BxRFpe+
	bb5E=
X-Received: by 2002:a05:620a:3907:b0:7c5:93ad:d2d4 with SMTP id af79cd13be357-7c59b5e7a76mr1207431885a.9.1742398945756;
        Wed, 19 Mar 2025 08:42:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzr+pCG36S2tpTWbn6oEA6s+NryxcuyqGx7+Si1rCRL7ZACVOni0kUwTcPwDOtCjsM5t/jhA==
X-Received: by 2002:a05:620a:3907:b0:7c5:93ad:d2d4 with SMTP id af79cd13be357-7c59b5e7a76mr1207428885a.9.1742398945389;
        Wed, 19 Mar 2025 08:42:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba88508asm1982032e87.186.2025.03.19.08.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:42:23 -0700 (PDT)
Date: Wed, 19 Mar 2025 17:42:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: qcom: Add DSP firmware for QCS8300 platform
Message-ID: <qecbhpoxqw3k6ua25ua3o7ygwiu3x2klr4vnln4sedenmmpeeb@nvdczbvesh7b>
References: <01872bb9-682e-4069-919d-3812c7bf3226@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01872bb9-682e-4069-919d-3812c7bf3226@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67dae5e2 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=V2X6L0mAzZrKCOlxlAkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: mQR1LMbxeHmKQ8GR127OWjQ1X_dn7lyr
X-Proofpoint-ORIG-GUID: mQR1LMbxeHmKQ8GR127OWjQ1X_dn7lyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=682
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190106

On Wed, Mar 19, 2025 at 09:10:34PM +0530, Ekansh Gupta wrote:
> The following changes since commit 430633ec9398a44575ed86f92e36541d5feebdd6:
> 
>   Merge branch 'robot/patch-1-1742367326' into 'main' (2025-03-19 11:10:14 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs8300
> 
> for you to fetch changes up to bd50c4979e4edd2f23b40c9dace8f9c05c807bb0:
> 
>   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 21:03:57 +0530)

Thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
