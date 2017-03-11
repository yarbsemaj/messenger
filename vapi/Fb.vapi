/* Fb.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Fb", gir_namespace = "Fb", gir_version = "1.0", lower_case_cprefix = "fb_")]
namespace Fb {
	[CCode (cheader_filename = "api/api.h", type_id = "fb_api_get_type ()")]
	public class Api : GLib.Object {
		[CCode (has_construct_function = false)]
		public Api (owned GLib.SocketClient gc, owned Soup.Session ses);
		[CCode (cname = "fb_api_auth")]
		public void auth_func (string user, string pass);
		[CCode (cname = "fb_api_connect")]
		public void connect_func (bool invisible);
		[CCode (cname = "fb_api_contact")]
		public void contact_func (Fb.Id uid);
		[CCode (cname = "fb_api_contacts")]
		public void contacts_func ();
		public void disconnect ();
		public void error_emit (GLib.Error error);
		public static GLib.Quark error_quark ();
		public bool is_invisible ();
		public void message (Fb.Id id, bool thread, string text);
		public void read (Fb.Id id, bool thread);
		public void rehash ();
		[CCode (cname = "fb_api_thread_create")]
		public void thread_create_func (GLib.SList<Fb.Id?> uids);
		[CCode (cname = "fb_api_thread")]
		public void thread_func (Fb.Id tid);
		public void thread_invite (Fb.Id tid, Fb.Id uid);
		public void thread_remove (Fb.Id tid, Fb.Id uid);
		public void thread_topic (Fb.Id tid, string topic);
		[CCode (cname = "fb_api_threads")]
		public void threads_func (int count);
		[CCode (cname = "fb_api_typing")]
		public void typing_func (Fb.Id uid, bool state);
		public void unread ();
		[NoAccessorMethod]
		public string cid { owned get; set; }
		[NoAccessorMethod]
		public string did { owned get; set; }
		[NoAccessorMethod]
		public uint64 mid { get; set; }
		[NoAccessorMethod]
		public string stoken { owned get; set; }
		[NoAccessorMethod]
		public string token { owned get; set; }
		[NoAccessorMethod]
		public int64 uid { get; set; }
		public signal void auth ();
		public signal void connect ();
		public signal void contact (void* user);
		public signal void contacts (void* users, bool complete);
		public signal void error (GLib.Error error);
		public signal void events (void* events);
		public signal void messages (void* msgs);
		public signal void presences (void* press);
		public signal void thread (void* thrd);
		public signal void thread_create (int64 tid);
		public signal void threads (void* thrds);
		public signal void typing (void* typg);
	}
	[CCode (cheader_filename = "api/api.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "fb_api_thread_get_type ()")]
	[Compact]
	public class ApiThread {
		public bool is_group;
		public string last_message;
		public Fb.Id tid;
		public string topic;
		public int unread;
		public int64 update_time;
		public GLib.SList<Fb.Id?> users;
		public Fb.ApiThread dup (bool deep);
		public void free ();
		public void reset (bool deep);
	}
	[CCode (cheader_filename = "api/api.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "fb_api_user_get_type ()")]
	[Compact]
	public class ApiUser {
		public string csum;
		public string icon;
		public bool is_friend;
		public string name;
		public Fb.Id uid;
		public Fb.ApiUser dup (bool deep);
		public void free ();
		public void reset (bool deep);
	}
	[CCode (cheader_filename = "api/http.h", has_type_id = false)]
	[Compact]
	public class HttpConns {
		public void add (Soup.RequestHTTP con);
		public void cancel_all ();
		public void free ();
		public bool is_canceled ();
		public void remove (Soup.RequestHTTP con);
		public void reset ();
	}
	[CCode (cheader_filename = "api/json.h", type_id = "fb_json_values_get_type ()")]
	public class JsonValues : GLib.Object {
		[CCode (has_construct_function = false)]
		public JsonValues (Json.Node root);
		public void add (Fb.JsonType type, bool required, string expr);
		public Json.Node get_root ();
		public unowned GLib.Value? next ();
		public bool next_bool (bool defval);
		public double next_dbl (double defval);
		public int64 next_int (int64 defval);
		public unowned string next_str (string defval);
		public string next_str_dup (string defval);
		public void set_array (bool required, string expr);
		public bool update () throws GLib.Error;
	}
	[CCode (cheader_filename = "api/mqtt.h", type_id = "fb_mqtt_get_type ()")]
	public class Mqtt : GLib.Object {
		[CCode (has_construct_function = false)]
		public Mqtt (GLib.SocketClient gc);
		public void close ();
		public bool connected (bool error);
		public void disconnect ();
		public static GLib.Quark error_quark ();
		public void read (Fb.MqttMessage msg);
		public static GLib.Quark ssl_error_quark ();
		public void write (Fb.MqttMessage msg);
		[HasEmitter]
		public signal void connect ();
		public signal void error (GLib.Error error);
		[HasEmitter]
		public signal void open ();
		[HasEmitter]
		public signal void publish (string topic, GLib.ByteArray pload);
	}
	[CCode (cheader_filename = "api/mqtt.h", type_id = "fb_mqtt_message_get_type ()")]
	public class MqttMessage : GLib.Object {
		[CCode (has_construct_function = false)]
		public MqttMessage (Fb.MqttMessageType type, Fb.MqttMessageFlags flags);
		[CCode (has_construct_function = false)]
		public MqttMessage.bytes (GLib.ByteArray bytes);
		[CCode (cname = "fb_mqtt_message_bytes")]
		public unowned GLib.ByteArray bytes_func ();
		public bool read (void* data, uint size);
		public bool read_byte (uint8 value);
		public bool read_mid (uint16 value);
		public bool read_r (GLib.ByteArray bytes);
		public bool read_str (string value);
		public bool read_u16 (uint16 value);
		public void reset ();
		public void write (void* data, uint size);
		public void write_byte (uint8 value);
		public void write_mid (uint16 value);
		public void write_str (string value);
		public void write_u16 (uint16 value);
	}
	[CCode (cheader_filename = "api/thrift.h", type_id = "fb_thrift_get_type ()")]
	public class Thrift : GLib.Object {
		[CCode (has_construct_function = false)]
		public Thrift (GLib.ByteArray bytes, uint offset);
		public static Fb.ThriftType ct2t (uint8 type);
		public unowned GLib.ByteArray get_bytes ();
		public uint get_pos ();
		public bool read (void* data, uint size);
		public bool read_bool (bool value);
		public bool read_byte (uint8 value);
		public bool read_dbl (double value);
		public bool read_field (Fb.ThriftType type, int16 id, int16 lastid);
		public bool read_i16 (int16 value);
		public bool read_i32 (int32 value);
		public bool read_i64 (int64 value);
		public bool read_isstop ();
		public bool read_list (Fb.ThriftType type, uint size);
		public bool read_map (Fb.ThriftType ktype, Fb.ThriftType vtype, uint size);
		public bool read_set (Fb.ThriftType type, uint size);
		public bool read_stop ();
		public bool read_str (string value);
		public bool read_vi16 (uint16 value);
		public bool read_vi32 (uint32 value);
		public bool read_vi64 (uint64 value);
		public void reset ();
		public void set_pos (uint pos);
		public static uint8 t2ct (Fb.ThriftType type);
		public void write (void* data, uint size);
		public void write_bool (bool value);
		public void write_byte (uint8 value);
		public void write_dbl (double value);
		public void write_field (Fb.ThriftType type, int16 id, int16 lastid);
		public void write_i16 (int16 value);
		public void write_i32 (int32 value);
		public void write_i64 (int64 value);
		public void write_list (Fb.ThriftType type, uint size);
		public void write_map (Fb.ThriftType ktype, Fb.ThriftType vtype, uint size);
		public void write_set (Fb.ThriftType type, uint size);
		public void write_stop ();
		public void write_str (string value);
		public void write_vi16 (uint16 value);
		public void write_vi32 (uint32 value);
		public void write_vi64 (uint64 value);
	}
	[CCode (cheader_filename = "api/api.h", has_type_id = false)]
	public struct ApiEvent {
		public Fb.ApiEventType type;
		public Fb.Id uid;
		public Fb.Id tid;
		public string text;
		public void free ();
		public void reset (bool deep);
	}
	[CCode (cheader_filename = "api/api.h", has_type_id = false)]
	public struct ApiMessage {
		public Fb.ApiMessageFlags flags;
		public Fb.Id uid;
		public Fb.Id tid;
		public int64 tstamp;
		public string text;
		public void free ();
		public void reset (bool deep);
	}
	[CCode (cheader_filename = "api/api.h", has_type_id = false)]
	public struct ApiPresence {
		public Fb.Id uid;
		public bool active;
		public void free ();
		public void reset ();
	}
	[CCode (cheader_filename = "api/api.h", has_type_id = false)]
	public struct ApiTyping {
		public Fb.Id uid;
		public bool state;
		public void free ();
		public void reset ();
	}
	[CCode (cheader_filename = "api/id.h")]
	[SimpleType]
	public struct Id : int64 {
	}
	[CCode (cheader_filename = "api/api.h", cprefix = "FB_API_ERROR_", has_type_id = false)]
	public enum ApiError {
		GENERAL,
		AUTH,
		QUEUE
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_API_EVENT_TYPE_THREAD_", has_type_id = false)]
	public enum ApiEventType {
		TOPIC,
		USER_ADDED,
		USER_REMOVED
	}
	[CCode (cheader_filename = "api/api.h", cprefix = "FB_API_MESSAGE_FLAG_", has_type_id = false)]
	[Flags]
	public enum ApiMessageFlags {
		DONE,
		IMAGE,
		SELF
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_JSON_TYPE_", has_type_id = false)]
	[Flags]
	public enum JsonType {
		NULL,
		BOOL,
		DBL,
		INT,
		STR
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_MQTT_CONNECT_FLAG_", has_type_id = false)]
	[Flags]
	public enum MqttConnectFlags {
		CLR,
		WILL,
		RET,
		PASS,
		USER,
		QOS0,
		QOS1,
		QOS2
	}
	[CCode (cheader_filename = "api/mqtt.h", cprefix = "FB_MQTT_ERROR_", has_type_id = false)]
	public enum MqttError {
		SUCCESS,
		PRTVERS,
		IDREJECT,
		SRVGONE,
		USERPASS,
		UNAUTHORIZED,
		GENERAL
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_MQTT_MESSAGE_FLAG_", has_type_id = false)]
	[Flags]
	public enum MqttMessageFlags {
		RET,
		DUP,
		QOS0,
		QOS1,
		QOS2
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_MQTT_MESSAGE_TYPE_", has_type_id = false)]
	public enum MqttMessageType {
		CONNECT,
		CONNACK,
		PUBLISH,
		PUBACK,
		PUBREC,
		PUBREL,
		PUBCOMP,
		SUBSCRIBE,
		SUBACK,
		UNSUBSCRIBE,
		UNSUBACK,
		PINGREQ,
		PINGRESP,
		DISCONNECT
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_THRIFT_TYPE_", has_type_id = false)]
	public enum ThriftType {
		STOP,
		VOID,
		BOOL,
		BYTE,
		DOUBLE,
		I16,
		I32,
		I64,
		STRING,
		STRUCT,
		MAP,
		SET,
		LIST,
		ENUM,
		UNKNOWN
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_UTIL_DEBUG_FLAG_", has_type_id = false)]
	[Flags]
	public enum UtilDebugFlags {
		UNSAFE,
		VERBOSE,
		ALL
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_HTTP_ERROR_")]
	public errordomain HttpError {
		SUCCESS,
		NOMATCH
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_JSON_ERROR_")]
	public errordomain JsonError {
		SUCCESS,
		AMBIGUOUS,
		GENERAL,
		NOMATCH,
		NULL,
		TYPE
	}
	[CCode (cheader_filename = "Fb.h", cprefix = "FB_UTIL_ERROR_")]
	public errordomain UtilError {
		[CCode (cname = "FB_UTIL_ERROR_GENERAL")]
		UTIL_ERROR_GENERAL
	}
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_AHOST")]
	public const string API_AHOST;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_BHOST")]
	public const string API_BHOST;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_CONTACTS_COUNT")]
	public const int API_CONTACTS_COUNT;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_GHOST")]
	public const string API_GHOST;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_KEY")]
	public const string API_KEY;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_CONTACT")]
	public const int API_QUERY_CONTACT;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_CONTACTS")]
	public const int API_QUERY_CONTACTS;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_CONTACTS_AFTER")]
	public const int API_QUERY_CONTACTS_AFTER;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_STICKER")]
	public const int API_QUERY_STICKER;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_THREAD")]
	public const int API_QUERY_THREAD;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_THREADS")]
	public const int API_QUERY_THREADS;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_QUERY_XMA")]
	public const int API_QUERY_XMA;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_SECRET")]
	public const string API_SECRET;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_THREADS_COUNT")]
	public const int API_THREADS_COUNT;
	[CCode (cheader_filename = "Fb.h", cname = "FB_API_WHOST")]
	public const string API_WHOST;
	[CCode (cheader_filename = "Fb.h", cname = "FB_ID_STRMAX")]
	public const int ID_STRMAX;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_HOST")]
	public const string MQTT_HOST;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_KA")]
	public const int MQTT_KA;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_LEVEL")]
	public const int MQTT_LEVEL;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_NAME")]
	public const string MQTT_NAME;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_PORT")]
	public const int MQTT_PORT;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_TIMEOUT_CONN")]
	public const int MQTT_TIMEOUT_CONN;
	[CCode (cheader_filename = "Fb.h", cname = "FB_MQTT_TIMEOUT_PING")]
	public const int MQTT_TIMEOUT_PING;
	[CCode (cheader_filename = "Fb.h", cname = "FB_UTIL_DEBUG_INFO")]
	public const int UTIL_DEBUG_INFO;
	[CCode (cheader_filename = "Fb.h")]
	public static bool http_error_chk (Soup.Message res) throws GLib.Error;
	[CCode (cheader_filename = "api/http.h")]
	public static GLib.Quark http_error_quark ();
	[CCode (cheader_filename = "Fb.h")]
	public static void http_extract_data (Soup.RequestHTTP req, GLib.AsyncResult res) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static bool http_urlcmp (string url1, string url2, bool protocol);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_add_bool (Json.Builder bldr, string name, bool value);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_add_dbl (Json.Builder bldr, string name, double value);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_add_int (Json.Builder bldr, string name, int64 value);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_add_str (Json.Builder bldr, string name, string value);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_arr_begin (Json.Builder bldr, string name);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_arr_end (Json.Builder bldr);
	[CCode (cheader_filename = "Fb.h")]
	public static string json_bldr_close (Json.Builder bldr, Json.NodeType type, size_t size);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_obj_begin (Json.Builder bldr, string name);
	[CCode (cheader_filename = "Fb.h")]
	public static void json_bldr_obj_end (Json.Builder bldr);
	[CCode (cheader_filename = "Fb.h")]
	public static GLib.Quark json_error_quark ();
	[CCode (cheader_filename = "Fb.h")]
	public static Json.Node json_node_get (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static Json.Array json_node_get_arr (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static bool json_node_get_bool (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static double json_node_get_dbl (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static int64 json_node_get_int (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static Json.Node json_node_get_nth (Json.Node root, uint n);
	[CCode (cheader_filename = "Fb.h")]
	public static string json_node_get_str (Json.Node root, string expr) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static Json.Node json_node_new (string data, ssize_t size) throws GLib.Error;
	[CCode (cheader_filename = "Fb.h")]
	public static void marshal_VOID__INT64 (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
	[CCode (cheader_filename = "Fb.h")]
	public static void marshal_VOID__POINTER_BOOLEAN (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
	[CCode (cheader_filename = "Fb.h")]
	public static void marshal_VOID__STRING_BOXED (GLib.Closure closure, GLib.Value return_value, uint n_param_values, GLib.Value param_values, void* invocation_hint, void* marshal_data);
	[CCode (cheader_filename = "Fb.h")]
	public static GLib.Quark util_error_quark ();
	[CCode (cheader_filename = "Fb.h")]
	public static string util_get_locale ();
	[CCode (cheader_filename = "Fb.h")]
	public static string util_rand_alnum (uint len);
	[CCode (cheader_filename = "Fb.h")]
	public static string util_rand_uuid ();
	[CCode (cheader_filename = "Fb.h")]
	public static bool util_zlib_test (GLib.ByteArray bytes);
}