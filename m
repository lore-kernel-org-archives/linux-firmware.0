Return-Path: <SRS0=GnA5=5M=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D9CCF9F8
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Nov 2025 02:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E602EC4CEFD; Tue,  4 Nov 2025 02:03:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D31BC4CEE7
	for <linux-firmware@kernel.org>; Tue,  4 Nov 2025 02:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D31BC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3H4O3a3616973
	for <linux-firmware@kernel.org>; Tue, 4 Nov 2025 02:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeyWsql1wDkBojVAPO7NbQZw2tqbAn/axnU3brz8jtA=; b=aXD8MURx/BRnBKht
	dqephUz3xOJkyQyiLbNAVhJhQAM4o67m5VceP8itKbP/ZvvSXS0xjcRkeYMbDw3N
	0oCdnaWQE/HkQhiHHQFBT8fNesTu1jv0cpT+FCU7zanR9biOvaiTUJAQG/kQ+Mtt
	vvgw5LK7S9oJf19nZz+ktzRVAYKMY1W1JqJi0qiQ7sDvu990vFlds7rHz8Cu23y4
	Tgp3yWNn3+zCFfK4KAGJT4A2H6gPEJX39Vw2xVtTAij2L57XYJcJ9HyIVJG8O4m/
	EwIDtYxFU4U2GW1Aj3/vux66YQeam2MB7ksYERwZoEngDGSYy3nZRcO/Qrmm3STt
	cqa2jg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70fhs93d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 02:03:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340299cc2ecso5761514a91.1
        for <linux-firmware@kernel.org>; Mon, 03 Nov 2025 18:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762221815; x=1762826615; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeyWsql1wDkBojVAPO7NbQZw2tqbAn/axnU3brz8jtA=;
        b=dl6FsUu0RQZ2Ji738ll4k00fIbQN/t73Y4VnzwxCgITvdvum/kC1aZfg2nF4K9xcCF
         ST4FZfpJnOcMCRhC4LvfM7h9GovN0uiEc8mKJm6tH9ILusmFHGGLu6Kg/hGAhRzLlFFP
         cuRme7JTrk9NkpKXkYcEFz3j7OEUbXj3AsexEW+l78/ke8bYKJlje7cqwzZZZgPrm4Xo
         B15kLIRVwFKnqjjRuwLHjFOpubqD2v45xvDZwTLH7Vkhq8b6WTJS1UxmRqjOW44Va9wI
         yt4OCyy1uYI4bEmUDVZBME4hUJzXgNSJY2PBdEcRUS+dXjKAxnrCu957Axgkd4tEyOXd
         9Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762221815; x=1762826615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GeyWsql1wDkBojVAPO7NbQZw2tqbAn/axnU3brz8jtA=;
        b=s0GHgsNJQuy/cuY2UYX4K9WJgQnP1U7uzmmXwwFSH30/RYnuAp380aMZpVpRVdlrd1
         NxrU3fp0nfyHtLBw4i3MuyJ/7A2L7UD8eMgyZ441yIiwkaME+RhLsmdpsZKW4c0JOx4d
         m6aOpErdl4qvePcbX04/GfxRIDMCVeW13PMkQBdx5zqSCMlqxFm6w3JBhA6Ms4ioURHY
         LK0fFFKv3WII2iIVjOX/FBl/IXewGishGTWBD0HMAfHgpMz0fX2S6AKmvPFvuAc05V5R
         1Gr5zqwsWn0bzny+mfhnhCmh9obPFAcC/rl/vML2GBbX/9cCmFV0KlLJwYpaBzS/H/PZ
         aw/w==
X-Gm-Message-State: AOJu0Yz0lo8l426LqDSlO+274QWRvPzhGRaQ1+KWzpK0St/uWunYpI6c
	MWeZnoy7HfXvgGP8GGc921YiYxbvZT/8DrcpQcnvNglTMN214rpPkwYtEHen35EJ4WVR30PilyN
	cVZW+8cktpHW2XLGyPgGvKZ7FBK8ywP7xMRvSBMZA+t8NlFZhx1AV4Bw0c6XWMLmRpSqMRLg=
X-Gm-Gg: ASbGncvCmzcsM6A9FTknlp4xdBqcJF8cqRzNh3ZgiCJJDfe61fcKY9vap+0OfMvpISX
	t9hLv25qsIEzIvAuQUaoHQ3nKG7kQPM1y/AARPooyK/WiIXG94wJiv3LzfsJl6Xq/19zFOppZS2
	QpHkc2ROOEruxILURbpU5uHP0SP+4KuGd+DXQfnZX7LjyxW14NYEJqqEJ1GjulNSSl72Ll7WGIk
	umybhVsEMgJkCN/LLDBWdbsJUWgVRKV9n0xUSLL93sPUIwG1zV2VKnuEEcQZkbENPXt5ogE70m7
	lE1uWmg3OnNyKrNg2LyWkTUDlwoFsBMbFiRJEdTkqj71weWK/g5eavshOTjfUQVPCU+AuCCt7iK
	jtCwxrYMF09ORexatOg==
X-Received: by 2002:a17:90b:35d0:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-341718a4fd4mr1892920a91.15.1762221815166;
        Mon, 03 Nov 2025 18:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKjw4JbLts9nVeew2JA4FhwdOjbHAwY/1+ZekkKg4fmDpxMusnRZGE+1vZxdQk/pHN9k+hXA==
X-Received: by 2002:a17:90b:35d0:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-341718a4fd4mr1892868a91.15.1762221814594;
        Mon, 03 Nov 2025 18:03:34 -0800 (PST)
Received: from [10.64.68.86] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d3ffdadsm261097a91.13.2025.11.03.18.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 18:03:33 -0800 (PST)
Message-ID: <3f0c6e11-5194-484b-8458-ffd56db0db1a@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 10:03:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add SOCCP firmware for kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <2c54ba08-67b4-4bb2-926b-de0e7cdd47bc@oss.qualcomm.com>
 <o6ta2s4ykj2kfinqrsf7ej7qjgfi6t6wyrc6jdpzjup6cveti3@gy467gpjkm52>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <o6ta2s4ykj2kfinqrsf7ej7qjgfi6t6wyrc6jdpzjup6cveti3@gy467gpjkm52>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAxNSBTYWx0ZWRfX4/N45YcH14HV
 K3MQm/v94gKwbSWQNWUqHRsFWPvgNemTaTEqksBN1gy3yYKBrcEcL+2nBuQz467jdA9bFZKKB1a
 0afXI7jHGtlbIvUnLLgDeZS5JRIS46AFpPc05xAHckyBBc7+QgaHldfBJzpJeglW5L4zfoBny2f
 EA5U6E+S4ZYVGPGmI1AGr4m8ZYFM1wROkfrAdTgQ4/nssnPqvwL5L/vAwXQB1+ty7fBPyl8e7CO
 xP+mULC1cTWxFhuYVIb3TQzav1iMXZ03vphUE/mkm7MRCAHodGb8FGlZ5vn8yXhYhvcFYp597kO
 VcsMgoX3mdFcwWmYLPVLNEy6ktEMHQCohTB4eDr3oa5Qayxi2jKIcpRN+Ab4909fyAb3GV6U4yp
 HdrkjDqBXtuyW1/VcK3IFVcVYIUwBQ==
X-Proofpoint-ORIG-GUID: n3TzyK67hY8zlU_wHgG0Vsyow8ybBmzY
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=69095ef8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=ctZ1ApDpHy4w6aFtVL8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: n3TzyK67hY8zlU_wHgG0Vsyow8ybBmzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040015

On 10/31/2025 9:52 PM, Dmitry Baryshkov wrote:

> On Fri, Oct 31, 2025 at 04:16:30PM +0800, Xin Liu wrote:
>> The following changes since commit 7234d25d1884114901070a9c42380e104e48a136:
>>
>>    Merge branch 'amd-ucode' into 'main' (2025-10-31 05:05:13 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-knp
>>
>> for you to fetch changes up to 90db1091087d0cc4af93160c0a52312738515174:
>>
>>    qcom: add SOCCP firmware for kaanapali platform (2025-10-31 16:08:38
>> +0800)
>>
>> ----------------------------------------------------------------
>> Xin Liu (1):
>>        qcom: add SOCCP firmware for kaanapali platform
>>
>>   WHENCE                       |   4 ++++
>>   qcom/kaanapali/soccp.mbn     | Bin 0 -> 2359480 bytes
>>   qcom/kaanapali/soccp_dtb.mbn | Bin 0 -> 94008 bytes
>>   qcom/kaanapali/soccpr.jsn    |  14 ++++++++++++++
> Could you please check whether it should be covered by LINCESE.qcom or
> LINCESE.qcom-2?
LINCESE.qcom-2
>>   4 files changed, 18 insertions(+)
>>   create mode 100644 qcom/kaanapali/soccp.mbn
>>   create mode 100644 qcom/kaanapali/soccp_dtb.mbn
>>   create mode 100644 qcom/kaanapali/soccpr.jsn
