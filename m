Return-Path: <SRS0=buff=SJ=quicinc.com=quic_vgarodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BCCD65C6C
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Nov 2024 11:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB401C4CECF; Thu, 14 Nov 2024 11:05:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5C9CC4CECD
	for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 11:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5C9CC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6AG2f015430;
	Thu, 14 Nov 2024 11:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzpYPt2nJXnckMRM3MQmyG4IxpjySQNdY6vnxtLr9f0=; b=jB3EuUcdtpvUXFPQ
	IDYpNZYFUQWVbggRiBva96srJnpdlvnLB1UaBz38H93PQHFHh7FKOZXYPHkXsH6Y
	dGISAHg0rvwGrBSXX+72IFNdNiETT/vCnRIjZHXWXLK1RV7Rc+ObM8wY+EjJVfvM
	PCCYCJT0EzqJULbirbEsjJ+3SE3AkM4gqGAZWEc0McYVz5Fpz0c/mVw44X1HDXa6
	x2Iasv9li/QtqHSsPKK2IKcQQM5wL7Fwp0c5OXjgp8eSYJT0/1Je9l7gL8FsLJ6K
	/89G0ALmPioBd+3RdYCdkbLkJGNGJ8jgvPOvuZtGhWl6mB6Kl9RVdX5UQy7BYHcf
	4nkOPQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsf34rbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 11:05:12 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEB5Cp8020004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 11:05:12 GMT
Received: from [10.216.8.68] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 03:05:09 -0800
Message-ID: <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
Date: Thu, 14 Nov 2024 16:35:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: add venus firmware file for qcs615
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Dikshita Agarwal
 (QUIC)" <quic_dikshita@quicinc.com>,
        "Qiwei Liu (QUIC)"
	<quic_qiweil@quicinc.com>,
        "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ju9YiR64BbgJD7zq9QwRzoQlop_UdaQg
X-Proofpoint-GUID: ju9YiR64BbgJD7zq9QwRzoQlop_UdaQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140086


On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
>>
>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
>>>> Hello
>>>>
>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
>>>>
>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
>>>>
>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
>>>>
>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Renjiang Han (1):
>>>>       qcom: venus-5.4: add venus firmware file for qcs615
>>>>
>>>> WHENCE                      |   1 +
>>>
>>> Could you please be more specific, what is the difference between the
>>> existing file and a new file? According to the soc_vers the new file
>>> supports sdm845. Should it instead replace the old firmware?
>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> 
> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> use v5 signatures?
Infact we started with loading sc7180 firmware on qc615, video init failed. So
far i have seen 2 categories in signing version for video bins, either default
or v6 specific tool.

Regards,
Vikash
> 
>>
>> Regards,
>> Vikash
>>>
>>>> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
>>>> 2 files changed, 1 insertion(+)
>>>> create mode 100644 qcom/venus-5.4/venus_s6.mbn
>>>>
>>>> Best Regards,
>>>> Renjiang
>>>
> 
