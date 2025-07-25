Return-Path: <SRS0=Ht0W=2G=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E5C87FCA
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 11:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEBB7C4CEEF; Fri, 25 Jul 2025 11:06:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF7D3C4CEE7
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF7D3C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9VTug001346
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igsmN1p/1em04hUeqSctzF6oLPoWWIOcO65s+YOgrc0=; b=VvA0ZsD/3WCfY8xk
	Q8xRzQXd73u5kA9K/XWW74HeNdh0tnnD4GEzi1IQTLowIPH4Yf+F49yRjga+wfy9
	ekQqGLnApGUWGjWN9bbXQ94sQEQX3H7hsCGCZ/LqEXHXBE+vNoHFX8if0Bqa6zTh
	oBiMz0wo4xHU2XapJdEbIMbBM5YRA/MYJoYCj7kBNoOYY6hiF6ADZ03Pg5+BRwmP
	R237uOotarNX1Bf3gIgnxYlTUcKWth1TbyRjG7TkU0gzcf3DW2xhQ4gXEgNsvf4Y
	jChcs3jOHjT0oZITTu6Q/Uhy433VC1UFejBOtlyelCAuCNIKc5tjku57XSiVl5VM
	WYCOAQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2xhsmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:06:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso30949206d6.3
        for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 04:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441564; x=1754046364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igsmN1p/1em04hUeqSctzF6oLPoWWIOcO65s+YOgrc0=;
        b=e1haz7Dghu3ggx6VrNhDC7Rpw2/TTQIsGc0mMBqRV9Y+Alpi5gBXHQz1N85YwKZNLK
         hWE+/Wg7CvJKfaP33ryaHTl7Voc9PORxxYu9s85+unGTPqx13WWQe7n7lYhuzNMXxGT5
         T5XKAUAC2JCZsyLyCP4TILc+CWh9SKRmtQcEq0f9ZLQI1pz5hpeh/3n/FHW9dj1cbmZc
         DDUhfAAHWYstOyxfe4HNfNoHh4AEhyEx0vWXqr1MZiN5KRpazq7+DlihAiS5OXVwbwOD
         1cUw1AoQvkqTpiytLzeqIinBWLQFysHslaGb9VHx/yQ4KGIutysEh0Q7CZXmsAXm72r3
         E1Tw==
X-Gm-Message-State: AOJu0YwF5xtydYIYPUGYKtIdI9OLCa4v8zlJGO8Bc11PCwA+OaWTLm9k
	eYZS72/FqpRD2mY6Joy+OFprEuhUSb5dBkEBn7sBqPA/4kuPF8It8S1rjUvxwjK9L24ixPeycx8
	Lmkuwup/WinwyCMUj4u5XY8R4nGFEVgSiAQCafpkeifEUcX1ffa/S4cSTY69wkLU=
X-Gm-Gg: ASbGncuAUHpqwafOimHAwPablc8BwON5Wdt22J58L9XwC3Gi3ETCI3TN+0GG1y+TS0O
	qDkgii+EjQv5P9cAym6oxzHdV4c2bwsTvbI1k3p3W3VS/amlEyWOFT3kAXH1adXoMA3jysaOSZI
	Vlhgn506kKm2QWGf85+zPEFVTosol18AbvKagHYIwwDg4muM7scZLQ47H/vb6l1pFa0EhCYaFjY
	h8SBS4l0b+ppbhSY6kLyZ86COu8SAvdeM7ww06wn5KPP3FYAg4hwXxKs5tSkgQ6tIsjHZF89UJv
	vvLolz4V1PtZlZEBfwAr6qERI0tYNTX90MCH8FaCZi1GHfPv+2posOgpQETF0NLJbo7wolDFhtQ
	JPe38rOBKudWSk9hve3Qq34he7m8+RJWxgw6s7ZValFy88OA+cJqb
X-Received: by 2002:a05:6214:258b:b0:704:f7d8:edf9 with SMTP id 6a1803df08f44-707205fd45emr16865736d6.46.1753441564269;
        Fri, 25 Jul 2025 04:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW4ZepFUFYsQfRpZK4RlWjxQ/I9CMAQ31KotqW43mlS4aQU5+lPXWCvF2bpRhuykVpw1wa8Q==
X-Received: by 2002:a05:6214:258b:b0:704:f7d8:edf9 with SMTP id 6a1803df08f44-707205fd45emr16865036d6.46.1753441563691;
        Fri, 25 Jul 2025 04:06:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6148e042sm82560e87.111.2025.07.25.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 04:06:02 -0700 (PDT)
Date: Fri, 25 Jul 2025 14:06:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com
Subject: Re: qcom: Add QCS6490 symlink for QUPv3 firmware
Message-ID: <csl6h6a4xt2tut72ochnscixkmx3pg275t5zfeougvasj3odi7@winomhljjsdh>
References: <495fc2f1-726d-45dc-ee84-ccd1e88f467c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <495fc2f1-726d-45dc-ee84-ccd1e88f467c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TqNZOoQhu9Q0DdsNtoIMhXmIHZgdo5RK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5NCBTYWx0ZWRfXwQ8Gx1hMiqZw
 soPhH407dV5vqmwJyG1aU/z1TnM9HsP195bi5zKWeXOtcg9robQwXO1B/EsWIJ5V1AMS652VeCS
 TpJ76M93QBTz5/VOqmboLk0dP72K1/XL+hPlrs9haOOZPw7Ee12aXjSPxACPV4F5o9TSlvZbGzS
 69bReqCBdXfnIQ6WiTF0fM0lcjkqp82PhCVVzQM9qNkFmS4cisH7pQIX+7CRtQVYxUBgHmL18xM
 0XdETbmztcDJJ2UozM0GoMuoY6bN0gLZtqyPX2+fucXkFgD1sJbgCa2fAq993nkY34sRMa7YRLN
 81mQzdilln+9amUUv05++6gccIOrW54G24xSTX5elThbJjMJengh1DeNsp4AMFgy/MfGmn7zM/Z
 P8EMPXZf9WYWDt9NlTl2tIPjj/wzAejJoUv7pEKYjP9FZiYailPn0O7MmmvlhdljXabCJ/PV
X-Proofpoint-GUID: TqNZOoQhu9Q0DdsNtoIMhXmIHZgdo5RK
X-Authority-Analysis: v=2.4 cv=S8bZwJsP c=1 sm=1 tr=0 ts=6883651d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=8sQNLLtcwxEUrBt_6DcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=934 bulkscore=0 impostorscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250094

On Fri, Jul 25, 2025 at 11:28:31AM +0530, Viken Dadhaniya wrote:
> The following changes since commit d89120bb80fc9d4ae7c7485033306acc12e306e5:
> 
>   Merge branch 'cs35l41-20250721' into 'main' (2025-07-21 18:56:30 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qupv3-fw-qcs6490
> 
> for you to fetch changes up to 8cc24d2326065a093bbe080a0b3b197ad8ac1905:
> 
>   qcom: Add QCS6490 symlink for QUPv3 firmware (2025-07-23 15:36:14 +0530)
> 
> ----------------------------------------------------------------
> Viken Dadhaniya (1):
>       qcom: Add QCS6490 symlink for QUPv3 firmware
> 
>  WHENCE | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
