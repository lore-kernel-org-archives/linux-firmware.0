Return-Path: <SRS0=ruOp=7R=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2483AD25039
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 07:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DE52C19423; Mon, 12 Jan 2026 07:16:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E667C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E667C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNRJ9Z4120877
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOj+jVMC3P53wP92nzGN7g1nkcQWoIgc6XBxBotcuQ8=; b=pOnf1wUhzHLQ7Uy+
	M08dPJnirsi9c2/4DhvuCnzP8I08adMpD8VhYunr81l7XU8U3l2f+stSbmKE/v4R
	9ybx4VaaOD/08171MNaArSQ9LZE4eskfLYVwvFkECLLYnb2XLZXxOMgZgd+BoilR
	r7q15yBV+YcFkoEwgOoZknhXhDZNnIwskppE5ezcUIj8hCWhKvNpi6lU2+VEjOVB
	g8gZzGZ2j6mep1G8kqtLMQA6bKL66EnRkIv+6So91AUSi4gfJ+nCiAt74PtZbzHS
	TknZK+BncxgYQEGSLVbhkunqEwvN0TDanJkRUMxOU4Cpjv+NquljssoSuf9kK7Yc
	oGIK5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhakvbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:16:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a4b748a0so15015705ad.1
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 23:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768202160; x=1768806960; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOj+jVMC3P53wP92nzGN7g1nkcQWoIgc6XBxBotcuQ8=;
        b=OQty5ExzxrmBuBD/8dYyadxaqdZ0t3hxNVUIZ28nBElyE/p3lbGJWkRiPaLSiBkoPR
         9uUISFgnUlXRX4hrl76/qewG54q6QoiNIhXEsl5SefuV+0290Bz6raeBJtsDJsDUPzz5
         Y9pzrXPckuIjZF/gRDEn7mwqO8zeP8d2vIudRNT1n/ZabL6pgFYPVOP+mOdXX8YF+p87
         Ox1CTaPs6GGbn4I89Xc2QsOzL/XWtyWz4NRK/h5dORvEIk+oCrKqgLYxK5tGRWSDL/xt
         8ADl681xmb79Eil60HZkdodFikRlVpIhzLDuQlQKQ9/rVQZC0paHxcIArWFoAK0nL4+g
         i7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202160; x=1768806960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOj+jVMC3P53wP92nzGN7g1nkcQWoIgc6XBxBotcuQ8=;
        b=hNZiqLG8sXvfv9PL3s/5/q3vy8PBmkdfSuXVBwX+eXg2yBJcXvJ1Xjk2xUAp7X/jYc
         1bB9wmNyfeqbDLkT99rYm0aDfYNxRDYNONyR0bH68tqR9DBtpfWuTahulEc95NQ+dNPt
         OP2mPYoUqQdKU7tqLkkegSdWI4yas4P+AJomXuP0hGOWu4Yfg5iRhDkAOKBrrwzWYz5E
         XD/DrmO7P58z/FXX44Z+A38Hahi5NO/qKXcM2UHVQK6OK0Wld6nflt+1/6uoHxaFhrPK
         QpKSeI/FRmEGijRLPAWE+CgSEkz90WRcmFw/zN0LULKPKVdzdjvhB79O0LSFfc1nnDgh
         G1yg==
X-Gm-Message-State: AOJu0Yy6ihqBiy2VmTz/e69zB/6v+zfups/Q2DKg+uStO//+OP/TNiYy
	ZC0PqyJAtvOM1bhe7zYpgzngvfLjmGCKabn8KeyAEgeS3349l29J8526m/DRToANZxMlTwcfE/a
	ZTF7MFwh1m5gGvf9YdGJcTxiAPrcr20IinX9muD25M25JNfg1IOImpWnel2j9cPI=
X-Gm-Gg: AY/fxX5U9V0+eWtKCvW189Rt+yDIQrCNmm70TQeG+mr3YTxIIeJznZ38GhzkrBKYrHL
	kbacELRrx1/Dst75Shtg7+Ca6GOdK5MgRr8GqababdZVCa5eC7xEd4BGt6lUm9AoIxW0lDdm5gA
	bQgUeTEhG78MMV+b+8fiIH2TNuYmg4vn6DdwV8d6/xweHZNSnxqH1qThae2hHyEZKpoJdNRYLGk
	24NnMDnzSQSpKxZjgEGVUkl5pkgW0Tn5zd2Jp3UW237kilH+TLoy2aZOUIzPvt9S5pEVwaX7Xkj
	QwBhEgZNb153JlVIUPHZf+PfKTJGJitFmKmhcTVPSzVKXtfcsULIrDBvaioDATyrA1G5jXYEIUo
	FZjYzJ85E9MO6IhwS3Sh0XsmIJVtdA5ViLKjA
X-Received: by 2002:a05:6300:8b0f:b0:342:a261:e2bc with SMTP id adf61e73a8af0-3898f8cd3e8mr15031070637.10.1768202160380;
        Sun, 11 Jan 2026 23:16:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCDdjQvrC+lo7pr0D4MXUJLbqN4wbVa/2E/DEK4ralLnnuY7mw89mgCH7/aAZ/hPW2w5zbzQ==
X-Received: by 2002:a05:6300:8b0f:b0:342:a261:e2bc with SMTP id adf61e73a8af0-3898f8cd3e8mr15031051637.10.1768202159908;
        Sun, 11 Jan 2026 23:15:59 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfc2f481sm16388961a12.10.2026.01.11.23.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 23:15:59 -0800 (PST)
Message-ID: <64b48dc5-165b-4a90-805f-37f76bcc352c@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:45:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
 <psonfqdp3driwwuo3ihs7u5cclt4exo6khaapyd2wlagcyq3ib@y4cratso4m7v>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <psonfqdp3driwwuo3ihs7u5cclt4exo6khaapyd2wlagcyq3ib@y4cratso4m7v>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ea9SQaHnWSeWNoL-ZwyBvkpqcZhG9y_t
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69649fb1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=nq5DXGOyJ_VBqESnZBMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ea9SQaHnWSeWNoL-ZwyBvkpqcZhG9y_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NSBTYWx0ZWRfXywfho/rhhrth
 K8+R+QQQSlQP8GnGgMncdJp8gmAO5JlZJ2kvAyTSOOKkoYrPS4+WzMl4ZZ0bYwFUjTjCfdBcUGF
 C0zB+sCDZgf0SjIS+LQUukIMHGiSILXrB+sZQzqpQrO8FdwY+gOGukbbzT+w00c3OqedpDgC/Jv
 +teIjYShKTwtMBe50ezTIrNk819J/8RLqKSiOWXbdpiG+UutRSSFchK3OxJQv/PO4xU3l8k6JZF
 IVGtlodVqfbsyrICVUPukS4uE9XF4KqpI20kZSPl8IiUzdjnfnMK9YneBx+nKSXmrA1mJQcTt8P
 T5iPDpDOp/QLbr0C3Idy0RyedAbTOeAh/hqymhT0/RHEkThi79bGR6+tfEGZhf0VskxRm4H1Qna
 7lcak6uR/L4La/t+SCpN531pKf5oDxk2rNYpc8fml3PcoKgnZmaQeplqvVa769/DXikr7rt9gqP
 Z31aSi9A9Uw2lf6L69g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120055


On 1/9/2026 4:46 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 12:24:58PM +0530, Vivek Sahu wrote:
>> On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
>>>> Hi linux-firmware maintainers,
>>>>
>>>> Here's a pull request for btqca bluetooth driver. Please let me know if you
>>>> have any problems.
>>>>
>>>>
>>>> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
>>>>
>>>>     Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
>>>>
>>>> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
>>>>
>>>>     QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
>>>> add required Bluetooth firmware files for QCC2072 uart interface.
>>>> (2026-01-08 13:20:45 +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Vivek Kumar Sahu (1):
>>>>         QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
>>>> will add required Bluetooth firmware files for QCC2072 uart interface.
>>> Oh. And your git setup is broken. How did you end up with the SoB not
>>> matching the Author of the commit (yes, I really want to know, how).
>>
>> my gitconfig file was not updated with oss mail id leading to this issue.
> Are you writing the SoB manually? I'm asking because `git commit -s`
> would use the same Git config for both Author and SoB.
Yes, I was writing it manually.
>
>> I'll update it in next commit.
>>
