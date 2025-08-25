Return-Path: <SRS0=DcMI=3F=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEDFCA0EFA
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Aug 2025 09:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 509CDC4CEED; Mon, 25 Aug 2025 09:36:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7020EC116B1
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7020EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8bbH7004446
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddTANXVY0/lnDzU/pN73Lq5B2h5Rp1oqqaw5x0MzoJ8=; b=M92WMnwfeRelUZkL
	W2EimhAFYH2GMHSeOgMi0TXzrBf/+mvsSUv/3bMloPT+x0WkucALCAUuEzoHSFEB
	y2hN0E85VC7yHsT2+WLikJ4TFhSbmGK5xdLk4ksTC2bCdesfTqFpvP2xlI/7gbJn
	YgMqAPWJfCwUEHnIIIA/ypeqlLxDyyfpgMfGmaTTDWn0GwPA4/x8tTWl9XKJKkUB
	7PKpEtjtJ0eyvhVxGJvUs0VpQRvZFkZhdkjmv87pzNTdonrZzef3ZfrDAAX0sJ+n
	8LLOvFt9pSSNqGFvs6Xb9Z9YPoGNNae0UZcqaTeQFW8zt4s5OhnGXgCvzwk89ssI
	00z+zQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdvhsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 09:36:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24456ebed7bso48751465ad.0
        for <linux-firmware@kernel.org>; Mon, 25 Aug 2025 02:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756114590; x=1756719390;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddTANXVY0/lnDzU/pN73Lq5B2h5Rp1oqqaw5x0MzoJ8=;
        b=RJxlELgbiyXmXreWy5qaUUv7AkMWPyieF2e/LbTZlzCn2gls8tL54JIAEZdKviyws6
         0iYGJnfJ32OzjWwCdyRn+wd6pL2Wn3ekRj2b+ua6glZjThR2phtmUMQqzNttozBCWPtH
         YYr9EllOFPURb3gv8vs3DwaT2uBsnZMxFEOqz3vGNPyC+7HaEC/VWstVmP1zLDWi7ttM
         ZJrTWL7e0VYcX07hfEWA9GuZ+oxHQViLmwE8GqsLlYjdaPX/CTi1GgUuRe3fHNbZPHAw
         PjU3jW9Yc6H0hBuP+cYTz+RfPYG9aI8kL4Z0x3BYUVXikSsst87GEkZ34CNRLPJRRibh
         JMWw==
X-Gm-Message-State: AOJu0Yw0JnNDbKlR1dTWpN4uFC3k8MX3jlt1CLjQptte8wBHYW5o2auN
	XHM8qSo7S+h1yY60qK3zqJkOrnq44cvXbNitV2govAWL9UKzaNF79sbLBAiuHI24o3NAlQpfsh3
	RUe96l1myKkVZXuCeu+KN/b2Lo9lMwP8+vbXHnY8MxRKdZMnAZv157iAJpNrL6b5MBegmzBthYw
	==
X-Gm-Gg: ASbGnctOa7AMYUhG6/Oa33KseipN3jTbwapm0VaW8jvnE3P18yIyjMQecxQTrnel4ew
	axZ6bW9NQv4jkTsB+/li7vd3HBURrVoag5pRUnkxLmgOpGDetk8u0WW5HNq2BKRJt3LreuXodsK
	+ldLvdIPzThJUghZTXI0/JDBjPQ4IUOj0K5dW8vuVu5b/i5CpS8bg6Cw7RMtr2SNF24BNKC+PHR
	pk0G3yn+j/n3FVIPICFHKN7z1+FGTS4GeSVRJRlv0uZAFjxO+7wR4fB2xGmgHQ9dwmNUh1PruGb
	LCQkWFZwnfUCfoelny5Mu/CCLsuSJiu6eJ1UXnZ74+aC9Vf12iEFEO7TSYSR3KS2VrS/wQ+SPOQ
	iSDwmAOcuVFCjxVs5fYy8tG8e4S1ELA==
X-Received: by 2002:a17:902:ec89:b0:234:986c:66cf with SMTP id d9443c01a7336-24632a36135mr144791265ad.16.1756114589719;
        Mon, 25 Aug 2025 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdDi+VXAM4FwhMCCqr8kMMjeWp/0qy5e1Oik5f/XEgT5r0K0g/pfDgoYWDVbsJZIvx99VSAA==
X-Received: by 2002:a17:902:ec89:b0:234:986c:66cf with SMTP id d9443c01a7336-24632a36135mr144790875ad.16.1756114589188;
        Mon, 25 Aug 2025 02:36:29 -0700 (PDT)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668880260sm63396065ad.128.2025.08.25.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 02:36:28 -0700 (PDT)
Message-ID: <17db4c46-d0f0-4e79-bf17-0e4c65ddcf83@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 17:36:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add CDSP firmware for qcs615 platform
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <4364ed17-0d85-4bf5-b1f4-7cfec60d6859@oss.qualcomm.com>
 <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <CA+5PVA6_-vuvwhAAZ3p98aOYyTfdQLishE+3h56oRzrieiaJmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tt-CaYcMNk-MTi5wzouAq2UAda4HFHY9
X-Proofpoint-ORIG-GUID: tt-CaYcMNk-MTi5wzouAq2UAda4HFHY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8vqQYlDJ+HE5
 jnlaczjvJ478q+x4/hFI/Q0pAfCaYloAs2zzZFYE2fajSjE1RK5EgnI6lqBIrwOHq/n6QXCc24r
 q5ku3l38x3KN4wxYNe7vwdl8jNwXYV8PpFIfKvC2xxuC+UoxlpCyqKFnC2Wgg6CTbzyYKlFwgTm
 WM1J9d4Vo0CnUYozi4CJ19hdAb/E3gh05ggySVgKt3/ARkjUUQg9OlJCEjpJyyVuK9M+9fYsfkv
 2OHXXnJ6X8ETN4bJc21BHM2Yv7ZPL9YUshPdOAh/fzLIjKwhlS9xj8uuncXeKAbgE2R485PvEKC
 pQ55jlbXyRzNAShk5rCZQ2EM51E6IeANyob5Eh9aGy8NQgzJCYg3j669Vg1XSO63nk2602yEg3m
 YZyxtxqO
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac2e9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=Vos4OIYHoSbqQLVRtYEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Hi, Josh

I'm sorry for the issue. I have fixed it on the latest 819-cdsp branch

Xin

On 8/19/2025 7:50 PM, Josh Boyer wrote:
> On Tue, Aug 19, 2025 at 1:50 AM Xin Liu <xin.liu@oss.qualcomm.com> wrote:
>> The following changes since commit 72a326cda49109765396e08f2453c51a852e3ec6:
>>
>>     Merge branch 'robot/pr-0-1755548398' into 'main' (2025-08-18 20:29:21
>> +0000)
>>
>> are available in the Git repository at:
>>
>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 819-cdsp
>>
>> for you to fetch changes up to 3611a33e984859def7308c94db9c29bc39e91a94:
>>
>>     qcom: add CDSP firmware for qcs615 platform (2025-08-19 13:45:33 +0800)
>>
>> ----------------------------------------------------------------
>> Xin Liu (1):
>>         qcom: add CDSP firmware for qcs615 platform
>>
>>    WHENCE                |   3 +++
>>    qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
>>    qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
> Your change to WHENCE has a weird File suffix:
>
> + RawFile: qcom/qcs615/cdspr.jsnFile
>
> This causes check_whence to fail because the file name is wrong.
> Please fix and resubmit.
>
> josh
>
>>    3 files changed, 24 insertions(+)
>>    create mode 100644 qcom/qcs615/cdsp.mbn
>>    create mode 100644 qcom/qcs615/cdspr.jsn
>>
