Return-Path: <SRS0=z3Z9=RV=quicinc.com=quic_vpuar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EF5D11701
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Oct 2024 06:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C4B1C4CEE3; Fri, 25 Oct 2024 06:22:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50BB3C4CEC3;
	Fri, 25 Oct 2024 06:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50BB3C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKb3ra031148;
	Fri, 25 Oct 2024 06:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=65P58TqeMc5BzmBTj1kH5/em
	lxKBbK0uxF7gaLvin4s=; b=M7vOIqbJ6bvP70a7S7HVvoDpKqLHUIFaInL7tBr7
	20PqfnctEEow8hJWnoIcXefKQPK/EV7TMXtC2Yj2zqmpohl2v6S2vleSnQsIAwN0
	iVcOOWxJ8wN/WqEYJODOgUbG4bw/1vdTa1Fa7IKn641jAicMdvyidjKph68+IaTx
	U4N0wcN6j9L4JgAVkFpYlCnaTTQAW1HLMSITm0I2QsaUOyqwrcRDxZDWvsTEPyQJ
	cxoRzSdOtK55JGnQ+nw7wy43edm9e01ezw/oGGTNMnmRBE6hwV3Zxi1lLy7cNrqh
	Sk/eY8eNM+ExO9Q00vka0UnWKVBEXZ8TVRY4RY9ea5r9IA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w018u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:22:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P6Mj6w024691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 06:22:45 GMT
Received: from [10.214.230.128] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 23:22:43 -0700
Content-Type: multipart/alternative;
	boundary="------------uxw6EhaaX8wTxPwLFnIJKgIV"
Message-ID: <dee84263-2885-4fcd-a42f-c59042809ccf@quicinc.com>
Date: Fri, 25 Oct 2024 11:52:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: check_whence.py: Add function to get listing of files
From: Vivek Puar <quic_vpuar@quicinc.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
References: <56dd4ed2-a4a2-4d9d-b23b-2a817fca1f94@quicinc.com>
 <CA+5PVA65e_3w-gh-ZQPS8PDzxyPNZ_NNFcp7TcMhWi0pNO-x+g@mail.gmail.com>
 <CACvgo520miap4jYcKOgirscGzhZiM3TzrT8-18FTZ16gZ7ERhw@mail.gmail.com>
 <c37774af-29b0-4b5d-9793-78e976b8e81d@quicinc.com>
 <CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com>
 <84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com>
Content-Language: en-US
In-Reply-To: <84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OpYz-KSW_2oViyPlUbYnbNbTryF4lvbA
X-Proofpoint-ORIG-GUID: OpYz-KSW_2oViyPlUbYnbNbTryF4lvbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=810 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250047

--------------uxw6EhaaX8wTxPwLFnIJKgIV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Emil,

Is this patch good to be picked so that check_whence.py check can be 
mandated and not ignored?

On 10/23/2024 8:48 AM, Vivek Puar wrote:
>
> Attaching the patch here.
>
> On 10/23/2024 2:29 AM, Emil Velikov wrote:
>> On Tue, 22 Oct 2024 at 20:09, Vivek Puar<quic_vpuar@quicinc.com> wrote:
>>> Hi,
>>>
>>> I've created another pull request, please review it.
>>>
>> Pull requests are not for reviewing but for merging code. They have no
>> code to review.
>> Please either post your patch or open a MR upstream.
>>
>> Thanks
>> Emil
>
> Regards,
>
> Vivek
>
Regards,

Vivek

--------------uxw6EhaaX8wTxPwLFnIJKgIV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Emil,</p>
    <p>Is this patch good to be picked so that check_whence.py check can
      be mandated and not ignored?<br>
    </p>
    <div class="moz-cite-prefix">On 10/23/2024 8:48 AM, Vivek Puar
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Attaching the patch here.<br>
      </p>
      <div class="moz-cite-prefix">On 10/23/2024 2:29 AM, Emil Velikov
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CACvgo511jG-4a6Ry1uTiSNHeaswMoXWDkDR6W7YQUT0yGL3mQg@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">On Tue, 22 Oct 2024 at 20:09, Vivek Puar <a
        class="moz-txt-link-rfc2396E"
        href="mailto:quic_vpuar@quicinc.com" moz-do-not-send="true">&lt;quic_vpuar@quicinc.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi,

I've created another pull request, please review it.

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Pull requests are not for reviewing but for merging code. They have no
code to review.
Please either post your patch or open a MR upstream.

Thanks
Emil</pre>
      </blockquote>
      <p>Regards,</p>
      <p><span style="white-space: pre-wrap">Vivek</span></p>
    </blockquote>
    <p>Regards,</p>
    <p>Vivek<br>
    </p>
    <blockquote type="cite"
      cite="mid:84586ef0-9108-4fdd-b3b5-fd9d15710612@quicinc.com">
      <p><span style="white-space: pre-wrap">
</span></p>
    </blockquote>
  </body>
</html>

--------------uxw6EhaaX8wTxPwLFnIJKgIV--
