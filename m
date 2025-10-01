Return-Path: <SRS0=g7BW=4K=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8203CCCA470
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Oct 2025 09:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C7F8C116C6; Wed,  1 Oct 2025 09:46:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71239C4CEF4
	for <linux-firmware@kernel.org>; Wed,  1 Oct 2025 09:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71239C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919N53C001263
	for <linux-firmware@kernel.org>; Wed, 1 Oct 2025 09:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QYacmlN/IHbVfgSoKe/IhQJt
	9KcDbO/cbo3h7ye0v8k=; b=HLIG+TCJGg0FAuy/rjjVQpaaq36v1SQS9Vmq5R2I
	szlhUxbPpvAvbu4mxMthjCBchb4cCsIQAYr+sU5EHXZgcAg6obX2UQYfJ8cVpHEu
	6M+sIHFtXFV10sNHn+c8jmUGmRQnuhxTufStxE7EuE5g6V1ItbR3ZhvmxSYlxLE2
	gB7P5R/aiussi3cunTrzrsFSlA2mQvd66eAxV8Lpdlr7q6lneP43cKARlyOt5rZM
	wuO5E/xeuMFhbg1SfnHK20A8bjEYag1/Kd6AhzFhaR2hlVyuFAeUwcxW5kPo1OVs
	Jz4QZpl65b1mdweD9I7K3/C0AKWiR5zH/1ADoWbNIEFSug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7hhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 09:46:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4df80d0d4aaso115245191cf.2
        for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 02:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311990; x=1759916790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYacmlN/IHbVfgSoKe/IhQJt9KcDbO/cbo3h7ye0v8k=;
        b=AZcDC0eI9iBo5zE3UYnywWGX8umeDwtof0DhWuXwgmg+j0ciyTReZoNpbSytLIAiUk
         MofLfuHiBHFFqdKTJl7CHt2WFa7A8Z4DTm250wHAwir4fsfHxR9BZGT+1TDtQj2DhLMu
         SO5vB1Z5V9CEmVd6QnFu947X7OLp/rfsidGzlQmukrcYbTtw6qmZ+BBAgeXFZdcVmET2
         8OuzaXzQ6YEC0gXPuJrxEw+71iquOA8cgaD4na0dsLsKsCBH5jF8PGmKZtYMZG3rGcGK
         e7w6d4kEQ8bYWj31BJzzZBKEwQjieu9Bq023466EpLPN/YLkhPauhip1UQgMG/IK69NZ
         d1ww==
X-Gm-Message-State: AOJu0YyGy4uCWh2CYLZHrxREBUzKQg2Jlm/8UHFQWRfr8NC5Op7/LUKX
	3H1NzydU7+oU7mlur+jQOG68MJHcpduxb8wHGRBEsLo2tePAfGg/SJo0/t02eSqnRmfmXirXC6g
	nVeij3etL/KVp7B502yeQhJ6S/w7CoRTEpUJORuWonpRyKAsemXA3dXZOB2AHPTY=
X-Gm-Gg: ASbGncvbF53rWDh8tzhI3jVa/2lYNIlrCJjXI5+xUoxYuglQvak3yjfc0nwjox924r8
	JPQek39FcguZcf2lBZlAVYbkzhVZjFMcdY8cU759HfOhcVp0AR8MpgvmGflow190gS0AVypBEZD
	VuWenxPM0dwypqjyLKFmVa1PtLoJWFlVdL3AQkB9mc5tX8lWrVO5AdU5r5W/Kw8u/24gFKEKl/6
	flsNgFkoo6aXaKC6LgfzoGiYyJsvJQuZ2yxCvusZuzqGmqCdhwMWZBisrnZJxX1QF6bhZrmUyqQ
	8v9K1oU9L554Uhotv+S+jsm8YTc2Q7w8o5OY2UB5MiA+rMsu1Sv/I0iFpOvHSPANsoy7E9MGxW/
	IJu2vHeHaf+Q5Q3X996KqmMKrwMODS5YlB5H2RiAUu05AmrGtYKxvJZL8KA==
X-Received: by 2002:ac8:5790:0:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e41eb17585mr33462681cf.67.1759311990431;
        Wed, 01 Oct 2025 02:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCCTbpIDU+khSabMHK+MkOTXnXFE4VpPG7Yh0IQQxrnFJeNOUN1DhuYqPrUkr+xkCq1YOGaw==
X-Received: by 2002:ac8:5790:0:b0:4b7:983b:b70c with SMTP id d75a77b69052e-4e41eb17585mr33462541cf.67.1759311989887;
        Wed, 01 Oct 2025 02:46:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586a064a22bsm3193808e87.59.2025.10.01.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:46:29 -0700 (PDT)
Date: Wed, 1 Oct 2025 12:46:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <b4yduyyymwk3r5agff3dqxxt2epyhowvhkgyi4fskrnhylshdl@xpwiykezjvgb>
References: <631ae62f-2849-4a2f-888e-52afd40dfd0f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <631ae62f-2849-4a2f-888e-52afd40dfd0f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX+sFQXkP1Vk/k
 MdMPHTC50qsMUfIjudF1TAiSEQgIodS2fQEQxqxnHHVU5NXh4Y94kf/Jc5wUU6mXs8Ty5lKsK/x
 gttzhZ1ItG7LZQCEDAX8/SIlESxEMVxjLnqs4cGVZOrP2P8bgnKR3RevP9T4DLZsiEUtlHFJS/q
 +k8QapGen5I8GYcMmKZMYeQ1RGzcB0XPIjYlASVe5BhtxfX6Gswo/lk9Fb+C2/enYDM5KcvL222
 dHilIp4VDzqSzGxBay1tLPjeNhQWVrYEKPT1d1yOvaFUYMobaQV/UxcrOqzqJYhi5I3h9hdMwds
 HMnDImIFNma7pt0EkfpFCyCid6RUaNbaA1Qqpk85rHLd9gN+Jyv8u2R9n/iCjNwWh750R/x0KzG
 yCKqQas02vc6UEdsTqxNqz1RNPOCHQ==
X-Proofpoint-ORIG-GUID: KYC2SNvtU2tJhIOlY1E0V02zAUXKradC
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dcf877 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=uFutvw1wnc4PQqH4b7YA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: KYC2SNvtU2tJhIOlY1E0V02zAUXKradC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On Wed, Oct 01, 2025 at 12:52:12AM +0530, Venkata Kota wrote:
> The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:
> 
>   Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-qcs8300-dspmon-163
> 
> for you to fetch changes up to e19ad53acfa6627509065463333296cb9bf05f25:
> 
>   qcom: Update DSP firmware for qcs8300 platform (2025-10-01 00:50:17 +0530)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
