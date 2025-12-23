Return-Path: <SRS0=iniQ=65=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D83E6F085
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B382CC116B1; Tue, 23 Dec 2025 17:08:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D295EC113D0
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D295EC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFPvRK2115198
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=; b=W0Ag5pY5jrz0kdXC
	dq0pDLHqS1nLbZBjiuX7i9g9id0vu1GFiDPn8YermEqxiVAKJbDvfrOSadnssgLB
	+SV+IN/abjuWFEgA/N9VZtbntZgYYh6DojbbJ7wR2xriwCwyu48J5mqGTJtPtDKL
	6ljmhGhR662UN8wLKzmi3pa4JbEea/ppn2II8D+PgbnYjssoDoGYhnzOi/UGU6Zn
	T0mEBjOY3JnL0o27mbkD7i9/4H7VwWiSYxksZRa71xjNhEPwSSHMbaz/hH8QMrZ0
	GsaBEgD+pO2GCFvnWzObqQ89wnzlthNw79DmPZdRBU80nL3/5Oq5diwSE5I9EpPt
	bJY3jQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudkf87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 17:07:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9433e125af6so9571428241.0
        for <linux-firmware@kernel.org>; Tue, 23 Dec 2025 09:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509678; x=1767114478; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=;
        b=jwYwgvtYNFwkG8dLV4dM6SUJjihk/8V+V0ZV+cenIfzzXm696aCAmtPZ9cFsdYjnXB
         SNzUbZEuvW8AnsD8n4Qv7hfJCIlZ4nsxicu9Wo7vrXuUdK0NyNyYW1WEoH7pLO6orXOn
         s45f8eUgzec3zBc4B4Qegf4NVcpcNrcpjSB9Q3MKwxyXwN2V3m7dDp5LHP09Ua6SF+dS
         XoEgyu6bDaEDBAamTl2kxgE4Lss/0IK6N3udFHr2NjR962Er6TK9gzT9TYrHSUDOfddd
         WMUCUBz7LG9p4lPJFkofI2bgUl6WZ6CYuxOCJe8mMlliGFDae08ePA4NkFAya5oupeXj
         K8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509678; x=1767114478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPBInWUU+hAdbqfFG09sngcW/N7tfHu+5Smtzp1GCOg=;
        b=o8LNZPtdDNPpn9XVXkkv5Gy1RvazEy4KyPEl9dCMiiiAxPdVKMcyxVb+1uEM5zgZZ+
         Uzm9NpbFFA5xXx5KPgyibJB0QZAjbcklezGIT+lfHnHWtFnKjiJhNFKkhVPifhvC7Jk0
         MmZfWotMzPT9WJXLGrg8YZnnI7o/fqzvvaI1Rsgnp7XfFnaVZ4bCdgToesn5EZpatNqR
         JSCAANlyCBVz2MiqQXYgX2w4kRnlzGZ11YSaKdLNKgk3MSTupNHde2vfxx/yoclxtVbi
         IJvQqtCV4mK/6s6XBQYprCQxpsz997YOEUQ4uV6hYya6FqldqW93HsonoJnTU9xDWo02
         P9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXgHObHvTSFC94uAWbCEaYhcwIR7VfiqiISuojgyLr65bd17TeuzuRuJp9ZgcWbPjXl/ekmgtcaZjn3aTxsqQ==@kernel.org
X-Gm-Message-State: AOJu0YwMvmvlNtbn/z5DJtRVaF/3ASfO88IddGyQWfk/lA++GhQaYLVu
	J5RgfB+Agop6+/JhF/TLBz9ujiwoxmD+dtQCc6cSQrpPMfQtpl5nEJ6Hatb8QGoO2K6PWqDJnM/
	wvGEu5NYHKWXQ8xBexbP0loGagMsz2qGIn1+Vi5hWHIK989y+AkKSIBpMRyzI7R8pmxT00AU=
X-Gm-Gg: AY/fxX4D0wMafINJNcOfQceLKMjPzhycrW0iMqeYJ3MEYbU/WVoti2u0/MEqjgUwkFu
	S59wbTyVh9VCuEzwNoRB8D+Lndb1OgL86/YT3JB8ymE/iy2tW7WbCoF3xzhsxq9qsqLpX2woObu
	6SMVHkoVkCvJQZDZgiM0a7RA4wUWxhmssswpoSJk5fWqAnX3HVPh97MfI1SwlR+Riw+mQcRetbV
	jYa7YzkTjOaAN4nu0OMbOcDvwKqwc8yn+ZdKVQl1SCWTcXyp6od61GrBwqenuB4XWA3+rnFxWvg
	UCrJjWVQuPIsi6tpnAoS6xATVkz+El02xIH6SsfMOcJvEqtW5TlvevZnYEAMgcPyuREBkfHa2qP
	8mMu2U9dwj60zUX80cV/hqd1wdq55l5pxNfMAUlzQkTy+XbxHM14G8/DzVfJFuEa8tSnqT2EVIY
	oa3D1yg+PbfevJ0pLHhxAQRUo=
X-Received: by 2002:a05:6102:2d05:b0:5df:c1ac:8ad4 with SMTP id ada2fe7eead31-5eb1a41d4eemr5433481137.0.1766509677712;
        Tue, 23 Dec 2025 09:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETm5QEXWpf7BGzE7LdZDGB+prGUr+uYy/GMDUx5kG1G/sLsB+UB6U7pT6XEYtMMNKfoosnow==
X-Received: by 2002:a05:6102:2d05:b0:5df:c1ac:8ad4 with SMTP id ada2fe7eead31-5eb1a41d4eemr5433451137.0.1766509677223;
        Tue, 23 Dec 2025 09:07:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186287e3sm4266065e87.97.2025.12.23.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:07:56 -0800 (PST)
Date: Tue, 23 Dec 2025 19:07:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lucien Jheng =?utf-8?B?KOmEreelpemInik=?= <lucien.jheng@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        linux-firmware <linux-firmware@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Albert-AL Lee =?utf-8?B?KOadjuWutuWujyk=?= <albert-al.lee@airoha.com>,
        Joseph Lin =?utf-8?B?KOael+iUmueFjCk=?= <Joseph.Lin@airoha.com>
Subject: Re: [PATCH] linux-firmware: Add firmware file for Airoha AN8811HB
 2.5G ethernet phy
Message-ID: <szpymr4gdhfowphfg4ut7fmake6pxtsnh2wgk24fqqmmsshdwc@a6jo2zgrykxh>
References: <KL1PR03MB7407AD36EEEDD5CD24FED069F1B5A@KL1PR03MB7407.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KL1PR03MB7407AD36EEEDD5CD24FED069F1B5A@KL1PR03MB7407.apcprd03.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694acc6f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JGXwu8-eAAAA:8 a=1Q2UqFy8AAAA:8 a=jwVX2wLjnwsJry3LTV8A:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=-p01NfQuWD51nzoNXB_L:22 a=Sfuq0_7asQmReVo7cE7s:22
X-Proofpoint-GUID: bOQaraX3nZz3P02_CVBgbydv2UA7-Hnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX23w8f9EYCgBS
 rtBiDnzJgZ0NsvDAR6iG3sIBmdpcjcOAWJTpf7PlnWsoGcIjzcoGqoHwDeluaL3CidNtzsTsrb1
 YD6A6m0TxpBafDoPbRxLUn1tp+l9Dyf4PZk6qIg3weE6Tmn+GW0sKP9gbgZ2+GvXN1wJOsrSbhz
 7qgruNZ/kf8JQQDqBlI8SIHC8kzfF0WPquYUZE3r+fAha4aKIS09FzKyy7STiddeno2B5i6OtqF
 pZlPra252xVsbjNRBnQCpH9QlpXq7EJ2HCKZycgXsVaSR/tIRKLSi6OVQKCtS8XZZfz2jw4gGct
 P6pSNKnL9MkrQT89cbJxEhRqdBjKct1viJrC6LIPJfh+RoVqmaX7x0q30i3qofPFEmj1s9skSg/
 D+qtFVC6u2t3m+C4RsXwRDL52rZTXUN7uwfa/PNbiuOJf96v99zfL+SpUTDAWc63sKe9Rw2wbQg
 KaNMPlgNnedTjTq1V6w==
X-Proofpoint-ORIG-GUID: bOQaraX3nZz3P02_CVBgbydv2UA7-Hnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142

On Tue, Dec 23, 2025 at 04:28:54AM +0000, Lucien Jheng (鄭祥鈞) wrote:
> From: "Lucien.Jheng" lucien.jheng@airoha.com<mailto:lucien.jheng@airoha.com>
> 
> File:
> airoha/an8811hb/EthMD32_CRC.DM.bin
> airoha/an8811hb/EthMD32_CRC.DSP.bin
> 
> Version: 25110702
> 
> Signed-off-by: Lucien.Jheng lucien.jheng@airoha.com<mailto:lucien.jheng@airoha.com>

Drop the mailto parts. Use a standard text form:

"S-o-b: Full Name <email@address.com>"

> ---
> airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 0 -> 32768 bytes
> airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 0 -> 131072 bytes
> 2 files changed, 0 insertions(+), 0 deletions(-)
> 

Please also update the WHENCE file, listing your firmware and the version.

-- 
With best wishes
Dmitry
