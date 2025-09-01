Return-Path: <SRS0=R8Bf=3M=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE9CA0FFD
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Sep 2025 05:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F7D3C4CEF8; Mon,  1 Sep 2025 05:53:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E0A3C4CEF0
	for <linux-firmware@kernel.org>; Mon,  1 Sep 2025 05:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E0A3C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VMPXdt011357
	for <linux-firmware@kernel.org>; Mon, 1 Sep 2025 05:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EtpGesV6B0Bzab+Z29QZ0yRs
	wencUj6JsxRIPGhopC0=; b=huIUH9u6WOYHcaMsaYa7qcVxqSbRLGM9KNYJyWbg
	ZVPtp3rpLslCtUmT7XnohWP5RZvNmHIHzQ4E6ypMYYZ/DRm2gRdP1dwl9L9U5EJG
	RpC128CoulEJHPlqLU42auwOOJxptVqFlFShREVNF2MJAdzHA7hvQY35fkRm2ZYZ
	OhyKV7MI9ROrZhAKQWK66mn3Hw9VESEy9AabpiJVKBmO5kxzOu6k+DZXayYANzlA
	2DO1mgeinXH5q3ujlbfzfo5J8tfOGukoPZ8We092CsJ1Ah2kdd55m50+Mo3GiSi3
	zpASXtEetm858S7HLMI23yKQu0DotcYM/4XgD/HuAKNzWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2ue8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 05:53:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244570600a1so49275515ad.1
        for <linux-firmware@kernel.org>; Sun, 31 Aug 2025 22:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756705980; x=1757310780;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtpGesV6B0Bzab+Z29QZ0yRswencUj6JsxRIPGhopC0=;
        b=uqVupLmWRBPnUHLZyB0zy4doZA2alNStPE+H8Q/D6d6sLJdEpm0K4MQJwgrvkaRC2U
         1TQQxyfLJ/iByNWMp3FmrxMC4oza29n4/SJTQrZB5IRUWsA523rhXu1TvB4G5IaggOvg
         mnWnfBeVyXxbZM/W+amr2entLSJDlmQNq+X4ygi7mT9x/8Dr+cB7/4gfXzs/4MCGi+lp
         3hucOmFSQtqGA4qh8UOuOWvxhOzyDlugWFAiMlPGMDVCaH3cw82QdJu7AtLDmovrHTBP
         lvTcvRpayFtVXatI6E35w83Y1DgyqAI+VeS+nR3NjEYHcyiVRr+NPPRsTxjtVmbawgaz
         wg/Q==
X-Gm-Message-State: AOJu0Yy5C3If+gii9zDwGoXykOsq2xdZbIWW8N+cANLevukqAoa4WH/A
	DYGje2oQ3soQd2mTWBKl7ePqwstVxV1D0Fu0VsZ/CxJVx520u2j5fxfbQ6VawjP2lIyAXEtQ8Hc
	AyPT2mCgJv0eyDUT3v3VoaJnrYCT1PprlsX4JFd+z+M4ztGc6j+zo0Y289h/0clY=
X-Gm-Gg: ASbGnctpBHN4YiFRKaTzUqokYXHLuwNA46WhanyhhS8/XerGyWxk/qUbIfzI3BrBvYT
	cmbUeZ0ZrW7/ORvOJU9yIlJEHggv5uXSw+C+V9klTiBH8Jk9yPJU3w4Wv+SGhlLSXc1E9rjeehq
	s0TN3tvffp713TsFSupQSO4C47tbLXLOoFh9D7UmStllx6l9B+Y5NgXnuNLkxbuaGo2MgD4BbUX
	JdNT78bEuL1objOSLPbog9zgrE1yOKw1UNyjCGfAj4uJ3YD0jqqy/oN1XLndPJwqp9NpknFXtwb
	wiK/5Yp6iwsBzt9IG/p0zHdCJ+uvdMiCoFIprJ4jMudspy9cV9Q2f3nSu5ubHddJB2pqk2OBqFe
	GtQVa5ETDlU6WkgozmWLARv+E/uAdUw==
X-Received: by 2002:a17:903:2b8f:b0:246:e235:49d7 with SMTP id d9443c01a7336-24944ac2518mr62479135ad.15.1756705980206;
        Sun, 31 Aug 2025 22:53:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdz5G6KTH/NUnI9hX+kw2aWDvk3Me+NsFnA71dKD60juI1qSXYW8dkBQ+6VCDt+cYbQWevNg==
X-Received: by 2002:a17:903:2b8f:b0:246:e235:49d7 with SMTP id d9443c01a7336-24944ac2518mr62478935ad.15.1756705979634;
        Sun, 31 Aug 2025 22:52:59 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705b91sm93324145ad.12.2025.08.31.22.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Aug 2025 22:52:59 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------sTZdR9mC7fflwgsS7p0m0AR7"
Message-ID: <10ab97d7-52b3-4056-8098-309eb35b0e59@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 13:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add ADSP firmware for qcs615 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
 <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
 <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
 <k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX/ar1jHNqxT8V
 d5K3BPIPUxjTRoFF8ZfDO/q09QLBGUDQCIDfVH6bbbBUTyXMnOvBfK3cRxc69Ey73YunPX7x2vn
 bikKL47WXqZsoweG/K5XKSnV2UduBjmD8knjlLagtpYM0qRrcU24vye1vn6pzvUAhq6sI2mmoyB
 2sZS8IBr0xfwv+JkCP+HoEp5i9cBBctrKsfxPrnIZ+Slzr/2EvQCxbbMH3PszmIFZQapUPLAsLZ
 NjcenGtLo5bHEsWCtSnPalsf45aBeXGurgsKciaLotgBGhmGlN8ZltPS79dVDKVnaCz76sfL/sj
 zJNKXON+f16B4cfuhsWXUkH0MKposd5+BWmgo/aqUVqnkCA5DtU7zPVs5qzw9fxmkPt2i2A2B04
 KtEgtnci
X-Proofpoint-ORIG-GUID: Vqw6RcpQM3wbTwcpjS-rQzRjO7Nupnyh
X-Proofpoint-GUID: Vqw6RcpQM3wbTwcpjS-rQzRjO7Nupnyh
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b534bd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=FkUAqRH_IU6dSnIgpQsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=atjVDZijcGioAZ6mdtIA:9 a=E1l0JjTJ8kay7F9s:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

This is a multi-part message in MIME format.
--------------sTZdR9mC7fflwgsS7p0m0AR7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/27/2025 10:07 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
>> On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>> On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
>>>> The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
>>>>
>>>>    Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> qcs615-adsp-827
>>>>
>>>> for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:
>>>>
>>>>    qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)
>>>>
>>> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
>> Fails check_whence because the files have the executable bit.  Can we fix that?
> I'm sorry, didn't catch that up in the review from the web page.
>
> Xin Liu, why are you sending a pull request which fails the check? Did
> you run 'make check'?

Dmitry, I have fixed the issue about the executable bit. The changes 
have been resubmitted. Kindly review them at your convenience.

The following changes since commit 
993ff19b553cd4d252fdf99f07c28825ef57b862: Merge branch 'main' into 
'main' (2025-08-29 17:13:10 +0000) are available in the Git repository 
at: https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-adsp-91 for you to fetch changes up to 
7aeff2162e6bb1875cabcf26caba01264194768e: qcom: add ADSP firmware for 
qcs615 platform (2025-09-01 11:00:40 +0800) 
---------------------------------------------------------------- Xin Liu 
(1): qcom: add ADSP firmware for qcs615 platform WHENCE | 5 +++++ 
qcom/qcs615/adsp.mbn | Bin 0 -> 8536204 bytes qcom/qcs615/adspr.jsn | 21 
+++++++++++++++++++++ qcom/qcs615/adsps.jsn | 21 +++++++++++++++++++++ 
qcom/qcs615/adspua.jsn | 27 +++++++++++++++++++++++++++ 5 files changed, 
74 insertions(+) create mode 100644 qcom/qcs615/adsp.mbn create mode 
100644 qcom/qcs615/adspr.jsn create mode 100644 qcom/qcs615/adsps.jsn 
create mode 100644 qcom/qcs615/adspua.jsn

--------------sTZdR9mC7fflwgsS7p0m0AR7
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
    <div class="moz-cite-prefix">On 8/27/2025 10:07 PM, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn">
      <pre wrap="" class="moz-quote-pre">On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
<a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
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
          <pre wrap="" class="moz-quote-pre">
Reviewed-by: Dmitry Baryshkov <a class="moz-txt-link-rfc2396E" href="mailto:dmitry.baryshkov@oss.qualcomm.com">&lt;dmitry.baryshkov@oss.qualcomm.com&gt;</a>
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Fails check_whence because the files have the executable bit.  Can we fix that?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm sorry, didn't catch that up in the review from the web page.

Xin Liu, why are you sending a pull request which fails the check? Did
you run 'make check'?
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Dmitry, I have fixed the issue about the executable bit. 

The changes have been resubmitted. Kindly review them at your convenience. </span></p>
    <p><span style="white-space: pre-wrap">
The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b862:

  Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000)

are available in the Git repository at:

  <a class="moz-txt-link-freetext" href="https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git">https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a> qcs615-adsp-91

for you to fetch changes up to 7aeff2162e6bb1875cabcf26caba01264194768e:

  qcom: add ADSP firmware for qcs615 platform (2025-09-01 11:00:40 +0800)

----------------------------------------------------------------
Xin Liu (1):
      qcom: add ADSP firmware for qcs615 platform

 WHENCE                 |   5 +++++
 qcom/qcs615/adsp.mbn   | Bin 0 -&gt; 8536204 bytes
 qcom/qcs615/adspr.jsn  |  21 +++++++++++++++++++++
 qcom/qcs615/adsps.jsn  |  21 +++++++++++++++++++++
 qcom/qcs615/adspua.jsn |  27 +++++++++++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 qcom/qcs615/adsp.mbn
 create mode 100644 qcom/qcs615/adspr.jsn
 create mode 100644 qcom/qcs615/adsps.jsn
 create mode 100644 qcom/qcs615/adspua.jsn</span></p>
  </body>
</html>

--------------sTZdR9mC7fflwgsS7p0m0AR7--
