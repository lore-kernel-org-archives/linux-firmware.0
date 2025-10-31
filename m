Return-Path: <SRS0=Ek81=5I=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2840DCCF9E3
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Oct 2025 01:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDB45C116B1; Fri, 31 Oct 2025 01:56:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4084C4CEF1
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 01:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4084C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1mfeO1571291
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 01:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAFHJmvR1lBB0IRJ6LMcQeimxeMRQ7zCU3SuGXAkDbs=; b=ZUEPFAe4EGAaEJ36
	AwSBaguakZe+tyRAU0Thyi+KtXf4Kh58fTDALFSsH901bOixbU+ffEC8iZHmariD
	3LcsngBMPHAN1rAi6hP5fJ9R+uL3zanhZEdpFtxYpN9OIPVx9/764WHrGTL3YMfM
	NgzkolRG9OgML5vKEfwvkU6dvikHjx5oZVJFixwakF7pPfp20Rq4DBryyEKsTQAB
	vTRIIX8mOhBErS6fDwHxG12mVJCOmJGSzUaQuiccm1aoD9+OJXSVWGDnQLsNZpQN
	x+mxioR4hz9GmndcgKBa6u0H7yQIB6UL4nnWj5/HffJGNci/kq1vHs5gdHMU7H+u
	Q5+7BA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc00gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 01:56:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a272da5676so422924b3a.1
        for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 18:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761875799; x=1762480599; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAFHJmvR1lBB0IRJ6LMcQeimxeMRQ7zCU3SuGXAkDbs=;
        b=AyyO/6qqOIZQeD9SVgZbDeXQm+/NLal/5p2/Iwm3tWReZe9hQ506IMO/sJ9HChJufa
         K8ttNgblRqlvpH6w9g2o19RRfQURBxbn3aQRq1ONSht5fWitXXlFiEiP6JXDCCiF6iYh
         e78oHFhLwNoq9IpcB8WtVMIsuBpOu68+cIGFXA+v1FjfxggVwvAV9Qt+gu4icweKmdmS
         Z3hs5tUJged2mc1o0+pS0X854L9mqwVOzYRL2LU8R1oG7I85TXEiui1NClH3epOK25oi
         GRMg4aFfaDHeclsgHYpYPfrMABCmEMLxjtz9z/6bhPXBoOOod/GrEsg+PaVMl/rMz8ic
         cvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875799; x=1762480599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAFHJmvR1lBB0IRJ6LMcQeimxeMRQ7zCU3SuGXAkDbs=;
        b=B99tGGu9ghe1pjH7cE6T7ynFKBwcfCbU8qmuQv74EtJVZjCYmIz/zqh17lv2FhEoW0
         hqGbP1gGobkZHiRXaCWMyli8MmnrNzcMDkNrXJDtXxQ4GcfsXMDPYcehIMKKO2zVtRd7
         8VmgAoeAxF8cVZld5QrodsS3+aCSETOAdKb0VEIPp5m6138km6hdfBMwSJQSgnLm3smO
         p7oZJx49hPG085URLsKr5dJ/fWFHmRyJR4gjHw7nsm4byDn1rQlFmsYgaGEp/8tPjhIh
         AACpG0nx/fMK07wnAyeD/iaU2HYEKFyqhPecqrvIylqvuc1UpMLP+UJgk0AJdvMdtk5j
         Yynw==
X-Gm-Message-State: AOJu0YxnhYyXEBrEsFZeOUmqDnNlsDoc1qC6dJix9Un7t1RZXKS7tGIB
	gtp9NwC2rkxCOM7q4HKg5hQ1bYwsnsULqCrtEoVCljEndrnPN9Q50w5uybCYGqVOHdGUU5q8vrS
	8q8vpSTfTZ0+8my4gcr8jCbVZCvP5a91U6szvc665brJhqqb+D+/NRl4qcKtdkUTRvBRlN8i7xQ
	==
X-Gm-Gg: ASbGncu4nPNcrcC+N87Yq4kMxbgEu/4iMFx4IfmgT4g/15QvnyIENeqHAunGz/279p7
	hUzAMGb2PHvmyPwKR5T1wHaIE8WXYXmhCvJIOjQ3uuWin6J6V+nkSxRqaVINLiHyVOFHtHJzyrc
	ivFJm1XNu0xbWv1/+3OEVS7VpRGH/TxqI93HHhb1rV9qi7gRbiivTwa69oGpDMnZUsfkKUzlDie
	3AMKASOBOSsPhCU382hIbaUN5KxMjmaJzGK+zoHo856YAK8Iihmf1jedl1Ytt07grmUsNiNOof/
	akkIN9b0/R6jFp3bKDgcYJdHvcwrD59hx79i/t4LlMzBKKJXMnO61TFsCBUMCszyTt+5aCPY2as
	q2oKY7mnyf0t96NLXsxeGBWSagDXitXdkyaphR1qjtElouigTcAqh0SL8lg4XUZs=
X-Received: by 2002:a05:6a00:180e:b0:7a2:7bca:49a1 with SMTP id d2e1a72fcca58-7a778ee319fmr1082754b3a.6.1761875799246;
        Thu, 30 Oct 2025 18:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk1IBMiHsfm7iGg8AzmU4sK5q8UO0X8J5Myx5CBu6LD29x3X0CB/48OG1KdICHHy7V0mXbvA==
X-Received: by 2002:a05:6a00:180e:b0:7a2:7bca:49a1 with SMTP id d2e1a72fcca58-7a778ee319fmr1082742b3a.6.1761875798752;
        Thu, 30 Oct 2025 18:56:38 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897ed5fsm248332b3a.5.2025.10.30.18.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 18:56:38 -0700 (PDT)
Message-ID: <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 09:56:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxMyBTYWx0ZWRfXzBozUkGnNfe4
 PAtTtJYKPulGNahJrfxcwXU6z1ksu32J0BMkSHMGaMrPHv+UBFbvQCfMCQmRb5olUx0B8J3xoAI
 0rbefv+ZEDUIeLwtRNsAd1OWPIuiSxsXqPIRllH+BavyJciYCN9CDkcBbm20oLa99fH6sw8/z2+
 710W3ABm1k0boIRET1wo+xfYzzYXJ9poKDcAP0WoLRU8DNSYDU6vEIx5V0zmev7ZgKnMuXcCnQ+
 YNhTztko0PjLw1+4i3XuKUimq1tyhhJRM+tj3Q19hHMK3Jod0kk40B2WVjqgd5EaK7aTzw9R8Pl
 gbeG7I3qVtDiTWzN+y6397c0+BScssGkhonjuJd9TPyGRaSyDoiJNWcMq9js+GvuyVOW+Undx0t
 bepGnErw82SdOK/gC6BOXLmKrS5u0g==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69041758 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Yqg2PKpaniyQkezR_XUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2GsHVUYMnvA_zbr1O6ezNoQg_64cBl_t
X-Proofpoint-GUID: 2GsHVUYMnvA_zbr1O6ezNoQg_64cBl_t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310013

On 10/30/2025 7:02 PM, Dmitry Baryshkov wrote:
> On Thu, 30 Oct 2025 at 12:50, Zijun Hu <zijun.hu@oss.qualcomm.com> wrote:
>>
>> Hi linux-firmware maintainers
>>
>> Here's a pull request for QCA bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit bfc84303530a1cdd603fc40aa25b4452f10870dc:
>>
>>   Merge branch 'mt7925' into 'main' (2025-10-29 11:21:38 +0000)
>>
>> are available in the git repository at:
>>
>>   https://github.com/zijun-hu/qca_btfw move_qca2066
>>
>> for you to fetch changes up to 45b3867b446ec97326ab4d5a5cc81c9f811132dd:
>>
>>   Bluetooth: QCA_BTUART: Separate firmware between WCN6855 and QCA2066 (2025-10-30 18:21:04 +0800)
> 
> From the commit message:
> 
>> WCN6855 and QCA2066 currently share firmware in folder qca/, but this firmware sharing will be broken by WCN6855's firmware to up-stream. Fix by separating firmware as following: - Copy firmware used by QCA2066 from qca/ to qca/QCA2066/. - WCN6855 still use current folder qca/ for its firmware.
> 
> What about existing QCA2066 devices which might get a new firmware,
> but not the updated kernel / DT?
> 

Customer did not up-stream QCA2066 DTS and also not specified firmware path
in their down-stream DT blueooth node.

Will change QCA bluetooth driver to change the default directory to download
QCA2066 firmware from qca/ to qca/QCA2066.

Will do above change after next linux-firmware release containing this change.

thank you for change review.
