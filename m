Return-Path: <SRS0=GMwi=3N=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66575CA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 06:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33B24C4CEED; Tue,  2 Sep 2025 06:04:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77613C4CEF5
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 06:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77613C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RmXg012350
	for <linux-firmware@kernel.org>; Tue, 2 Sep 2025 06:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yCz39abf2bM37yPVlOChPh25
	PKGqQQdpH1c0Oxv9A0c=; b=cTYtorw2fSJ3QXPyRrMwEAfZKBQ4shAzBUoOeG35
	4F321z6yy5UXfzzQPSs0kOx1eWCEP49tjGtL1IM2lFI22BvegCxNZNxKoJLAhbKv
	uUfyaaiuS01FMxie3ECaXecFocg8enA0PS1RTvupKoCUFN8+1UjAYS4KnZyYIDRM
	2VxTYIBlI8PtA9cd30SBiOIY04LViDZNDV95n0q3Zjh5fTEFnrwHxME8IMUqWJ1l
	lOUPuKrLa7prC2JoQ3shU6WCJIwbl7D6tC0buIa2Sd8O68/BW7g/txX3ZedDLJpo
	tmlMjWjeTEH2tpGTaqtZpnOnZwgMmrzYn+2vY1a3emmJ5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fek51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 06:04:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-325ce108e16so7624357a91.1
        for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 23:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793063; x=1757397863;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCz39abf2bM37yPVlOChPh25PKGqQQdpH1c0Oxv9A0c=;
        b=jXTIEmKPnOXTX7AdNnu0Il+mBmpYiFeiH2eYDDHC9MEWfOpcSnjpVSTJ9gAMAOSriL
         wyNiSziyokqrg7tffnV9ZjHzZdui8ViX2eAlXzLh3aGZBf+YYXXQTX3UZwhC3gIpAQ6m
         mebEiQV+h7MIifsSevNuYISJiReLI8J3abCRnIQ60Cw7Vlsa1Rc8aSzgIXCQoQ1/+lMY
         aEFVlJggISFCAGqSNd+2D9XHiHIIEyYeOabfg1ydgTDeuvtaLjeLQBXdyokbhyqkyW1s
         zEMMu1YzHKB7HTuAdGa+9pJ1KReBqbt2nDwqIbNrhI7Q4xRS7XsV5yqoxqxxDzRMusvv
         g/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE1bnQUm42QOE5yvY+CS0BkTmZMdmghlmM/gSw1Ru1USmS7xiu2iUn7jNDQN88tqWTfU7IZFKqvTdLGjyufA==@kernel.org
X-Gm-Message-State: AOJu0YyhInmv+qftNlO2jWH9xDNons+QyRyqee6fxooTtKkgOBfXs2nF
	1b8gFzDio6qyAa5gaRawZGUle5DydGBcfXMlcnuy9NdOEzoMgXOP3zCt2c+6vAOAiFzaDHmNlOL
	65hQrMwno1MWwUB1fZfaG258VOzrYFL9Yb8AtlBpNZvh7cT7IqlkZyO9QJu7ydupfA7m7WHE=
X-Gm-Gg: ASbGncvOxKDGWmHcdgOb2pRVfNbKETGuzpMd4F+PLhvy8ahytxwZSqoE9ckzMN7xx6U
	JtwaLKF5Mwu5ypG6gZrWrlOTm9iTfFAz9QoyhiL73AwjOyMeeL+sdGoTAv0PNiNEGxj9HVWkBm+
	53GTXRuql5YxgniGp5F7+YjGnwuIIvGxubV+Zh7RFTMM5Xym/XPnsDi4KQezbP38BMoeOPOPJtI
	fepqn1C/In+QyItgJFpjG75iprAB89io6cq4SpEqnqGKs/95LzILTtQ3b6nSDNnyHOzRWINbU+Y
	Zm4M3ajtxNM3zeEkrG7YhVrDHmBgiv9GziuJTUmF+c+ByQXMcrOK8zg55Uv8dZrKQ13QIQM/p3I
	r7zJWWDGwxbI9irPKGusHKwTcHbrsJg==
X-Received: by 2002:a17:90b:1843:b0:327:e781:3d2e with SMTP id 98e67ed59e1d1-328156f9516mr14295715a91.33.1756793063287;
        Mon, 01 Sep 2025 23:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHVIcFjJk/mV9ayd1m18EwmkuWrtcX02fmqsBNxAOPkLZQpPDvy48q/cPtfyvIfzOQhAMdA==
X-Received: by 2002:a17:90b:1843:b0:327:e781:3d2e with SMTP id 98e67ed59e1d1-328156f9516mr14295683a91.33.1756793062665;
        Mon, 01 Sep 2025 23:04:22 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e445d875sm729506a91.11.2025.09.01.23.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 23:04:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7MIUXdwTuzJAFyx00u3wCxw0"
Message-ID: <a3d37ebb-4221-40fa-a270-5d999837ce79@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:04:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP firmware for qcs615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
 <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
 <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
 <k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn>
 <10ab97d7-52b3-4056-8098-309eb35b0e59@oss.qualcomm.com>
 <w2wyrr5i4igi2dh4sea5qpk2mbumo2kd7jt4dvykyuxmoevw3m@fp6xf6w4gfso>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <w2wyrr5i4igi2dh4sea5qpk2mbumo2kd7jt4dvykyuxmoevw3m@fp6xf6w4gfso>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX5XRdav5FKpun
 wSmUxSC5YRYNvw1HjSfhqanODY/1J0dMhxzQIavTYZmjkAdPCL3OyrrgaOdDzMj0P4V9M3iYM6T
 0I9NWjOKtfNG312yjIwWU22RMEVy+u3pk2VURNqyXRy2D+iiZ8bbgm9RY1RRxyyCPFrYznTn1a2
 ZEeODV6/XUbq2BVKUnc/IxmdzcdYh3pxy3jStFtgOMR34PrBFwZ3IiSAEP3NTv9TTI2FMloZHbh
 teMuCI3mCDC1OXvkXXjNEM+E57Jw42SRU5caUGaONyYRyKQtVfU5YP1GCFQVobA9YOHjb3EBgs7
 k2E3KBGh1Mk5P0XPBfhQ63dUTHRTZWHeddg96KnzqU9C9pGLvciROhhmUJRV5zQQ1yZFTDSx3B2
 yQQGwYGG
X-Proofpoint-ORIG-GUID: T2Bjw7LeRtvb2L-eiuAiSLBkdAsLYLHk
X-Proofpoint-GUID: T2Bjw7LeRtvb2L-eiuAiSLBkdAsLYLHk
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b688e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=HPS5DdbydRik85rvjPoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Orw1Mfy2sd7opYe8BskA:9 a=zptsByu3lyLu-pV6:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

This is a multi-part message in MIME format.
--------------7MIUXdwTuzJAFyx00u3wCxw0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/2/2025 5:49 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 01:52:56PM +0800, Xin Liu wrote:
>> On 8/27/2025 10:07 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
>>>> On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>> On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
>>>>>> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
>>>>>>
>>>>>>     Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>> qcs615-adsp-827
>>>>>>
>>>>>> for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:
>>>>>>
>>>>>>     qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)
>>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>>>> Fails check_whence because the files have the executable bit.  Can we fix that?
>>> I'm sorry, didn't catch that up in the review from the web page.
>>>
>>> Xin Liu, why are you sending a pull request which fails the check? Did
>>> you run 'make check'?
>> Dmitry, I have fixed the issue about the executable bit. The changes have
>> been resubmitted. Kindly review them at your convenience.
>>
>> The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b862:
>> Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000) are available in
>> the Git repository at:
>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> qcs615-adsp-91 for you to fetch changes up to
>> 7aeff2162e6bb1875cabcf26caba01264194768e: qcom: add ADSP firmware for qcs615
>> platform (2025-09-01 11:00:40 +0800)
>> ---------------------------------------------------------------- Xin Liu
>> (1): qcom: add ADSP firmware for qcs615 platform WHENCE | 5 +++++
>> qcom/qcs615/adsp.mbn | Bin 0 -> 8536204 bytes qcom/qcs615/adspr.jsn | 21
>> +++++++++++++++++++++ qcom/qcs615/adsps.jsn | 21 +++++++++++++++++++++
>> qcom/qcs615/adspua.jsn | 27 +++++++++++++++++++++++++++ 5 files changed, 74
>> insertions(+) create mode 100644 qcom/qcs615/adsp.mbn create mode 100644
>> qcom/qcs615/adspr.jsn create mode 100644 qcom/qcs615/adsps.jsn create mode
>> 100644 qcom/qcs615/adspua.jsn
> This is totally garbled. Did you check what you were sending? Also you
> ignored the question, why you've sent the changes without running 'make
> check'. That's sad.
>
> Now, could you please send a new clean pull request? Linux kernel world
> usually prefers people to start a new thread for a new version instead
> of using Reply-To to send next iteration (Mario, Josh, please excuse me
> if I'm giving a false suggestion here).

I'm sorry for overlooking your question earlier.

On the first send (branch qcs615-adsp-827), I did not perform a make 
check But in the second send (branch qcs615-adsp-91), I had already done 
a make check and resolved the executable bit issue.I have not submitted 
the firmware before, but I will submit it according to the rules next 
time. I will start a new thread for a new version next time.

--------------7MIUXdwTuzJAFyx00u3wCxw0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/2025 5:49 AM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:w2wyrr5i4igi2dh4sea5qpk2mbumo2kd7jt4dvykyuxmoevw3m@fp6xf6w4gfso">
      <pre wrap="" class="moz-quote-pre">On Mon, Sep 01, 2025 at 01:52:56PM +0800, Xin Liu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 8/27/2025 10:07 PM, Dmitry Baryshkov wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
<a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a> wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

   <a class="moz-txt-link-freetext" href="https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git">https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a>
qcs615-adsp-827

for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:

   qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)

</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Reviewed-by: Dmitry Baryshkov<a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Fails check_whence because the files have the executable bit.  Can we fix that?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I'm sorry, didn't catch that up in the review from the web page.

Xin Liu, why are you sending a pull request which fails the check? Did
you run 'make check'?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Dmitry, I have fixed the issue about the executable bit. The changes have
been resubmitted. Kindly review them at your convenience.

The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b862:
Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000) are available in
the Git repository at:
<a class="moz-txt-link-freetext" href="https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git">https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a>
qcs615-adsp-91 for you to fetch changes up to
7aeff2162e6bb1875cabcf26caba01264194768e: qcom: add ADSP firmware for qcs615
platform (2025-09-01 11:00:40 +0800)
---------------------------------------------------------------- Xin Liu
(1): qcom: add ADSP firmware for qcs615 platform WHENCE | 5 +++++
qcom/qcs615/adsp.mbn | Bin 0 -&gt; 8536204 bytes qcom/qcs615/adspr.jsn | 21
+++++++++++++++++++++ qcom/qcs615/adsps.jsn | 21 +++++++++++++++++++++
qcom/qcs615/adspua.jsn | 27 +++++++++++++++++++++++++++ 5 files changed, 74
insertions(+) create mode 100644 qcom/qcs615/adsp.mbn create mode 100644
qcom/qcs615/adspr.jsn create mode 100644 qcom/qcs615/adsps.jsn create mode
100644 qcom/qcs615/adspua.jsn
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is totally garbled. Did you check what you were sending? Also you
ignored the question, why you've sent the changes without running 'make
check'. That's sad.

Now, could you please send a new clean pull request? Linux kernel world
usually prefers people to start a new thread for a new version instead
of using Reply-To to send next iteration (Mario, Josh, please excuse me
if I'm giving a false suggestion here).
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
I'm sorry for overlooking your question earlier.</span></p>
    <p><span style="white-space: pre-wrap">On the first send (branch qcs615-adsp-827), I did not perform a make check
But in the second send (branch qcs615-adsp-91), I had already done a make 
check and resolved the  executable bit issue.I have not submitted the firmware 
before, but I will submit it according to the rules next time.

I will start a new thread for a new version next time.</span></p>
  </body>
</html>

--------------7MIUXdwTuzJAFyx00u3wCxw0--
