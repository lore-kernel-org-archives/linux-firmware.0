Return-Path: <SRS0=tUf/=55=oss.qualcomm.com=wangao.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72315CFA466
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 02:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55DB4C116B1; Fri, 21 Nov 2025 02:50:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CEC2C4CEF1
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 02:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CEC2C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKKAVCi1885701
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 02:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2+n1s+ZBxD3uQNGvfDIp2Vzs1w8fVTilYJKt5iJVXU=; b=NwHKsKhRuuEGOl/a
	i8RsdJx25tfa64J13lHwiWsnPDUw9D4I9bSQTVdBkcv0vveWBqXlLE8oUenZPhur
	gcIJMSZT91q6Mks0pfVmA2scE4VKZrxglz0ivW3Z/mxModLP/OZDFuaWk7kYMYvH
	491kuiRJ2FeBu0GEZOlnXQ4lhtHVZbYXIJtoN5WERP7qbQ2yU+8EASU/74rYHMtH
	7yUfhjcEzpr0CWKA+/bY6owhjRgz8/RmpwrddG8YGOLjhj3ZdSNFH2/ZZVqlYzEA
	F4BgScKEFD9ijDqgRvmcJ5xjQEAcevXuvfxOup/jit5OHVGP3fbxH7nk4i83XVy4
	Y8qlQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahver3qe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 02:50:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9208e1976so3681324b3a.1
        for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 18:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763693446; x=1764298246; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2+n1s+ZBxD3uQNGvfDIp2Vzs1w8fVTilYJKt5iJVXU=;
        b=kabXkCEnafYUChrafHMqgvkL2SVqq4m+0w4lyfwSjHCpwjvUSvPmKACvQbXM2l5Gbr
         x7Q1kih/FwQFGWgHi2N58YajuSoB/dHGnoBHRIeUaA1g/RmEYtQas7mZ0llciWuSxhGq
         rCfhGUWZtUScV7VlNoIRQtPV9yTNazAtjK9uv3+5jEyqcVsb0kHsZzoNEhUCbXl03e0y
         yAGVUZ11EW3DuLFIKZOdQP55KTI6qwwypnYKkYwQ6cALTgvrJNdERwXwgY3/JAiQZ6Fm
         3KucJiXy/xs6BunN2qYyqWWpU5wqZb9N81DV4UtCdY0zAlHQSQosBwFCTsXZhr5y2Bfg
         EXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763693446; x=1764298246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2+n1s+ZBxD3uQNGvfDIp2Vzs1w8fVTilYJKt5iJVXU=;
        b=BVWaq1HMww4zSt3uzunq4uKfpw9K/xwbW0zUUrz4Kqc1e2vaNoyE1EZI775ggAcNVc
         5vNkWSHdYj9+JK+LMwUmq3DIHpNbk090+UBlPkNrxSwY0VqSxGCKX5RTwBAdv44nnp1c
         ElgYc46pJrU+L/MTiJAP2UxHIW/NJ24QNtXxugN3LR4SSgqe40KPAbbpJkRwljgLU8Li
         FSeGOhPLwUDdsTEeVCUhyPgQO304A+p+0bGQoQo0k8t0/LmNA3gE5ITjeCIDsuUZblTT
         qjpWxZk+Vm9MZqlbCTGi23ZRo0gyNi66PeNpB/YiJnM5rUTSRnzzk82v08AnCYiFEaKL
         wNFw==
X-Forwarded-Encrypted: i=1; AJvYcCX6+GHKutafQtrexcU3/VTcIawZfT6PdMmqPs0cDIxFKG65uV6HnAxyr2miTQnRJ9ssHKYsoXY/IvT+eSwQRQ==@kernel.org
X-Gm-Message-State: AOJu0YzAn6wFSobHoWV2fkfLPDs45urwMzP/NNNO2abNm+WqnX5bKgQ4
	xtDGq+JtFPvpiX5sw0UGX9umMqHIiJFr4w+CdiAN+YIzGPhXGYvCALMGB3zdMWZuQRZhhhlVG3N
	cmyh8OSgt/fFSP70taGrVWdi8an8Pd29eaiDEwmknmKgljsBqzKFEYdDKh4ddfEw=
X-Gm-Gg: ASbGncvwElRx7j1ZCzzuNdf0JxDPLvs020JbclDAP9R/OIMv0OdgQUgSG8IFPXOrwP5
	tKLBGLaW+to43WBq095NE99JvRkiaX0nW5H8LRtZm9lLCruE14re8alJE2z2btzImLfH3pHc7qq
	6zYp2VecENtI8EkdKCU5z82VzSllIww2YWODluOkBKg8sQYDDhm+ojs7WvA/UgLjOcxyZBIiFLg
	xaiEItg7ln6O3rxblBN5BVq0D1o6Fb8JDNa+lVYsf3nM/aqIoQSEMAEMOIsK/9unyN3G5lP9jiJ
	oHBvGPX1MfpSRz19t3nbJ3XaX++pPz10Vi9wFuVU2BVF83KTHMZySYktbQwxlgt1hkBjcPoZxbZ
	XSiudoV+O5idGIRzyBcGyaZS+hZlT3d9wu/dgSFMpTxUzqfsCsZxzqifZQeDEL8m5pfVinnB9ji
	kMnFw=
X-Received: by 2002:a05:6a20:7489:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-3614ed3e8bamr1078382637.36.1763693446056;
        Thu, 20 Nov 2025 18:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp0vKZDEX8s9tYFnH4ku8laiB6dUkWLbyh4/10HzLzP7XCdbbCWPZQ/6mPQoF1E9a2Qq3hrA==
X-Received: by 2002:a05:6a20:7489:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-3614ed3e8bamr1078352637.36.1763693445545;
        Thu, 20 Nov 2025 18:50:45 -0800 (PST)
Received: from [10.249.17.18] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd7604dedeesm3963482a12.22.2025.11.20.18.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 18:50:44 -0800 (PST)
Message-ID: <050606ac-9753-4b12-b7b2-df85375b4d6b@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 10:50:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
Cc: wangao.wang@oss.qualcomm.com, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <d80357e8-8790-4997-a562-b4b6f7f48aee@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <d80357e8-8790-4997-a562-b4b6f7f48aee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZvPg6t7G c=1 sm=1 tr=0 ts=691fd387 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=vYitfJ1YxoKrBDlhLyMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: gfoTh6PsjOeCSiSSvxz2RNdSdkWaEFwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAyMCBTYWx0ZWRfXzD0DNd7sxa9K
 BwOUp9UCT9hJaVZPan+FEZw3VTdxq71KVIUKAYP53GZAkFL7X7szTbvo2xlPASG/gwhANxPjC1y
 T+rgblG+hh73GkOsUjwcvwg4DgYy64I+nROgtqXj6fKql6ZDypRsmsX7fVmNJHidA0G+PUtaD+y
 3bTh56BIEgNt2XDQb2UN3+3zEuglWyuAXXxjsaRO5WFRPF1S8STqZf6VnFmynjtAziZZE+Dxcqx
 ktxlrA78IvR0gkudzGF4hqFrg3paau2Sarq2z3bGbV/zKDqyMK5A/bxAQMh3oaw555srBkJ5dj4
 fwRWUoLVckZby+wTu02mD304gfybsrDN2ENpfZxJKYtBkCAfeAGmb0p+M87N3YEbo7O8IYNoIVn
 RF77jwEPJnPN+5Tz63xHhQDzvpMdEg==
X-Proofpoint-GUID: gfoTh6PsjOeCSiSSvxz2RNdSdkWaEFwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210020



On 2025/11/20 18:28, Renjiang Han wrote:
>>> What is the status of the current venus-5.4/venus.mbn file? Does it work
>>> AS IS on Talos EVK that is being in process of upstreaming and on QCS615
>>> ADP AIR aka RIDE boards?
>>
>> @Renjiang ?
> It is fine on ADP AIR platform. I am asking wangao to borrow EVK 
> platform to verify it.
>>
Hi Renjiang, Vikash,
It is fine on EVK board.

-- 
Best Regards,
Wangao

