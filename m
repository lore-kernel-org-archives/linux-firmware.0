Return-Path: <SRS0=NJ94=7L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84732CEFCF2
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Jan 2026 19:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60D5FC19422; Tue,  6 Jan 2026 19:13:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989DBC116C6
	for <linux-firmware@kernel.org>; Tue,  6 Jan 2026 19:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 989DBC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Gil1m4137528
	for <linux-firmware@kernel.org>; Tue, 6 Jan 2026 19:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=afCtUlAR0uXNVQVVDPU7058+
	Dilium7T7k3JLL+yz/Y=; b=mNSAHLngy5iSc9D/wyh4LOH2LYo08rVs68ihJ9Uf
	o1ddre1ReDDyaTwda8vPN/2IlEyhp1GyI9l7CeQXZnHrJeaVugRAob72H+ooBfnH
	uaiQmN4oCS9lzBPaDnZ6Yb1W67BGF8VML0hvaikZ6CEHeg+zj/20c1b1dlT4SnoR
	yJRV50LF6PY1iIw8h5R69K5WcarvdFBlO9c5mxwo+s1QG3zJaWRMBZM9JyqdUszu
	crW9NKUroGeKqVtNvgSWNRXPflcCazdEXxj/d2mXacrap7Kw4D1o9UaZHktKuTIS
	dCmcmhptm0nkXSUdc3Lf2JFZRRAUEN9hcMiRhusmLRLmXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e0f47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 19:13:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso46163731cf.2
        for <linux-firmware@kernel.org>; Tue, 06 Jan 2026 11:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767726807; x=1768331607; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afCtUlAR0uXNVQVVDPU7058+Dilium7T7k3JLL+yz/Y=;
        b=eGUkxMkDN4XIz7ORzzKF4v4irO1+Dpau53PV1vvC9Fw3wTpOBmbXJEARgbHvRgYEbC
         nNh6Klm5tMJ0c/IKbRQclpXfXee6zU/5Ug7RY5Dv/UDRDZKPc5Ph4gLqw3KplgAB7xQT
         X25VOhH5kUipx06XmtjUz2fUxue41w/gH3ZlFLlX5NCsx0NQdYSpjPoMqDdkb6KsTZxY
         wtImNx9T3Mp44zlZ0n+EkxL9F1lPcuLlROUpdkveVz45oI95sdRAT803lcshkze4HKJH
         UFQUqthgmeQ4NqJFanTkSln2SsMeh1YEVi76lCWYd8xg8mNFbasiNHHDvFeGQ+bhQwWW
         j6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726807; x=1768331607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=afCtUlAR0uXNVQVVDPU7058+Dilium7T7k3JLL+yz/Y=;
        b=P1r2iyW/d6uQtFr8McpWPqNM+oxyl8otG/6gYEn78oWHG4hLtZdT0djXsaCSjqZluk
         Ah4yBjHru/MNZk5Vl1ZUKkLqrXBDCU9E5tvuMRMcpEetLATOhu+TywlvMtMTgPDR4FmI
         +t0EdBKeYqvIc1M9bv4K3kuB4f9wM2+9RTMR/Mc9G5LODlAVPNJmYp/Yhq7rwolYaqrC
         9SuW6LjE3b/dtBa8zIBjrZdiz8R7UpRFqo9VekAlac4dgZ8FE5Xd92lfNgCBto0vJFBY
         F0/IsS5PRlyLGdOQpfgXugAamX0TZdTf8/Prd6SHPoHaV+wXB+2K9c0qt8AQgkPHC08f
         4zpQ==
X-Gm-Message-State: AOJu0YzKzVJEdeNiwd9BirkjyNUd1zlt+P9GJhDhuBoW8/wUlHhcySex
	RmXWM+adD3/nM1B+oLNJRh/8RG4m+zxMjBOpJMPTD22HRJ3xcbZTLNIzJjJQ0XGd+Pha8IJ+k/M
	crwbjKkASll1wPIg+jQaxPHntmTcApIn285B+lltzM/43CGKOwJFx6fvbjRDrMHY=
X-Gm-Gg: AY/fxX5zrzzVeEAww0Soafc65zToyk9WI9/vbewmxCxzLaKIhhWh/8cJhgQ9Nc8Z7Da
	uHiRVRb4xCEnfWukkvHS71L1doYqfOmKninO8RZEUbVDLhijzLIJpfVaiuGF881KNXGhnaJMmet
	Vjo7Y8Isg6wyutH56FB9drZ5Wn5Dyzzic1cqmphFcszd21dxzqU0fZXAlDmQTFwCbazlHmI+7Cs
	UbdFQj7ELDjNxfbnbKMs5zl/uTXRwG+S/GW6bJvpW7uBkeV1p7XH/Ts8aR7odII4IQBHHjEofNk
	lqF62E0FwS+KxyKp5mUJy4M4iLjOc+Q4HV5Qr0IVrKYzkXW4E75notBKxYVK4EuTj6BVqKlNP/x
	SnkfyroRsincrFWrRKBTXG7f9rZomXWpdLUXp3W+xWEX2thwQWlEvdyp2JbB0TfJyLTBAw7xw46
	E0Lr3smA5Y4pRFtmWyeMTubAI=
X-Received: by 2002:a05:622a:8f15:b0:4ff:b2cd:5ec4 with SMTP id d75a77b69052e-4ffb2cd61e7mr6006441cf.43.1767726806621;
        Tue, 06 Jan 2026 11:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt9z+kU2bu5aou7XpxBYYfdIHVMsq2lwLBFfTsJO40pKaHDWeBVV64XA5CqZkOCr+RNL7wJA==
X-Received: by 2002:a05:622a:8f15:b0:4ff:b2cd:5ec4 with SMTP id d75a77b69052e-4ffb2cd61e7mr6006231cf.43.1767726806166;
        Tue, 06 Jan 2026 11:13:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6ac0a769sm418397e87.21.2026.01.06.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:13:25 -0800 (PST)
Date: Tue, 6 Jan 2026 21:13:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <buveyxgldbvsefg4qngpg4uxczwvpjr37ikmbfgm7bl4izmiay@yqygae32jkh7>
References: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2NiBTYWx0ZWRfX7idHMsqvKmGZ
 C6/GldRNMxZi0MgHjFGhV2LyLVL9yz9MX5o2jRB/5T23M4mq+E5E6e4BNG8V6gzkKruRtFOM0at
 8uLRnjxpYU2CRIRoOTvAf66tcRnaVochZFOVnSs1+W/z28nca4nZGEw+3YnIBwilt6GP+XXfDXN
 0fvCS98W5BnV+i8c0NqsT9vseaJ1reuzfwVFf5HRdxD5LnQ26M13n99zYBpJQNoy8t0OUpvxRGZ
 KTxxmrngouZWoRjy2qTgsxxWIfwGtix4Fw37iMSBBYgHqyV+xPw/psH+GEtn7mftaOlqEOjqRvn
 6bInh3pTd7cXp+6/w4kd7DrMTqiecXVYdshsWM0GMTy4llX4NJ9Ohic4JEcpmsXA2VqzuLNiHq1
 7AJ9I+CZAPHAWB/qawaIHeOr1nl5+ftaBDSdmds2db7yqIQk3cOVFsBPKwDZJEB3rYX4k18rtAU
 iiqZRrHRpIZ0s8IEaFw==
X-Proofpoint-GUID: vXgYv5dIKXT3CNN5Q41CT_YggYfv6wVT
X-Proofpoint-ORIG-GUID: vXgYv5dIKXT3CNN5Q41CT_YggYfv6wVT
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695d5ed7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=SlpdmATz_RgLBfTfWzQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060166

On Tue, Jan 06, 2026 at 11:39:50AM -0700, Jeff Hugo wrote:
> The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:
> 
>   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7
> 
> for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:
> 
>   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)
> 

And merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/845

-- 
With best wishes
Dmitry
