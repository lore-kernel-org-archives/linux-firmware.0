Return-Path: <SRS0=d37l=WV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B06C3600C
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Apr 2025 10:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 533EFC4CEE7; Thu,  3 Apr 2025 10:25:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CADE1C4CEE3
	for <linux-firmware@kernel.org>; Thu,  3 Apr 2025 10:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CADE1C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339ruRI008163
	for <linux-firmware@kernel.org>; Thu, 3 Apr 2025 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZepjgxSoxbn09odKVuuon5LU
	JQHXjto8k2o8wHv8P9c=; b=CCmjrwXhmF/i2PxGNIn714uIUHZXSN+/+vFA/15Q
	6N3xIAMBrBQPGUWY0Nt24FBBN6v6yw8R/ZCqYNt11mZm4HSl8ogaZhDyVhnLwQDE
	5Yfa0rIHHYguCJR5khQXYysE4wnYdEyeJYlgabzNcfNw9eC+fokosBFBRGYGEjbm
	KSIZcfrXOqeekBjYr56HyMar0LdxJzq0YAXTbE4cr4tSiW/9Z7YJEvZF3CMovzpk
	EECl3oHggQhQNwv+tnIStzOHW98f/c7QumqS/S2xH+WtQJPEoQqhYroQig/ovXPU
	JmqQLRuWKud0OwpfYf1ZToMtxb/FFv/jprN+E57liSViJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxbf49f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Apr 2025 10:24:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so167839385a.1
        for <linux-firmware@kernel.org>; Thu, 03 Apr 2025 03:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675896; x=1744280696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZepjgxSoxbn09odKVuuon5LUJQHXjto8k2o8wHv8P9c=;
        b=kYMrXfX1T+kFJjXt9xWqQSTpQiuJN+o6slvQwz/novbV7QsEZ6YHlA/JvrRE0wDkRM
         USjvCS0SUapllmbmUiZfaAgTGsDHhTi5HDbfqJHwqyZl2ghawMDAji05ffiplgdNuFUt
         N3xxXiuCSFEa7tNJs62jhtMgPqCuuiRu/4zJqzZ6dXHcNgLPAQXzAFOAWV3i7ESeFDiH
         K4Q4956NezKLqu4wVUs5BSskZMgLqwns8HMW4XHsVcoWfw8BuyC9Z76+rRpFhzsL6KEl
         JbFQL372LDV/AsDd187TYed/skoCS7uWm8jClolDA6kfRv9NDhebvl3KUy1AgSsvzOco
         TaxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuq8m1UvJ+lY74NVGUOo1vA1m6NzO+kvfCbs7qeiCaUv74QuQG+PHqG9bRP013zc/7uJgi1Z4dh1JeaiPAKA==@kernel.org
X-Gm-Message-State: AOJu0Yy0Y/V7x8BDthvnXDfifs4i98uF7phfzASC5i81kdaxkOsf/CC4
	jom+wz/o1DDdJ2a+X1sh/E0zm1OhkERom2Hl0mxNE6OQqsh3k09DS2JFV9uLllidCYLKCyGv1dm
	RVpxlKt5zK60rlYuo2mQUNKnvQXWDIO8EDzlZ7KDeSsiE7X+KA6WyIUDCO04=
X-Gm-Gg: ASbGncvu6zqnjMDNVonESFViac8mlgG+3zygd7ICJ5Jfq0O3nSgTZ2aVadRyjdlxLp0
	iCCVNVTOMNXhGMjs+Vv8AwJDmJdQQQHOlqFhzWXHGzb+trDPO0sdkEg1jDOXGLW+OqIzky+dE3K
	RXyM3Svbz3nLUE/Z7UBjrCea4AFVcig8+b9nqc9WoqshDJsldiNeJ0jOuwtYcx5p0Ednltw7si3
	QfxccC/IGhnANLCPxnN2DuoC60qCY3o8X+W0iF1XA7Y4Fk9mVtIi7vf+Mp/lH+9oeJ6PylYhrKx
	kDsyxoT2UaPRzaEZN3uv/KSrrPa4EdPtZHH1wYn2ZjeNILrhZJFrzsiLuRA4XkS07r/azuOvKdS
	5yvg=
X-Received: by 2002:a05:620a:830a:b0:7c7:5afb:5878 with SMTP id af79cd13be357-7c75afb58e8mr1351523585a.25.1743675896628;
        Thu, 03 Apr 2025 03:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdsHNy2w7/XpcdCyeK85QhRqYpm6h77+QKaxZzstVEp3AR12CvqtIapsMMQI4vwhDRRPKZxQ==
X-Received: by 2002:a05:620a:830a:b0:7c7:5afb:5878 with SMTP id af79cd13be357-7c75afb58e8mr1351521885a.25.1743675896350;
        Thu, 03 Apr 2025 03:24:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5c208esm110625e87.79.2025.04.03.03.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:24:54 -0700 (PDT)
Date: Thu, 3 Apr 2025 13:24:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, linux-firmware@kernel.org, agurenko@protonmail.com
Subject: Re: [GIT PULL] QCA: Add and update Bluetooth firmwares for WCN785x
 with USB interface
Message-ID: <c3fngv3pzjovoheki5owovdprxauallycpsqmlbaqtpvroppi3@yfxbndxntyvb>
References: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <882c9f31-96a2-4057-aab1-5d39df3f20b7@quicinc.com>
X-Proofpoint-GUID: wnQu2pIsbfOAJ1BCMjR1rf7XUgo_sGH-
X-Proofpoint-ORIG-GUID: wnQu2pIsbfOAJ1BCMjR1rf7XUgo_sGH-
X-Authority-Analysis: v=2.4 cv=F/5XdrhN c=1 sm=1 tr=0 ts=67ee61f9 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=qnCiB9-Q6lRKnzBEusUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=922 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030037

On Thu, Apr 03, 2025 at 05:41:11PM +0800, Zijun Hu wrote:
> Hi linux-firmware maintainers
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 41a528251649772edbcb705a40e617fd14858e53:
> 
>   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw hmt_usb_x86_0403
> 
> for you to fetch changes up to b12240420adec3089fa0bb5a09eaa0cefbd8ce76:
> 
>   QCA: Add 8 bluetooth nvm files for WCN785x btusb (2025-04-03 17:18:24
> +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (2):
>       QCA: Update WCN785x btusb firmware to 2.0.0-00790-3
>       QCA: Add 8 bluetooth nvm files for WCN785x btusb
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
